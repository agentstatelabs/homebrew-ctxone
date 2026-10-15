#!/usr/bin/env python3
"""version-guard — refuse a tap push that would LOWER a formula's version.

Runs in GitLab CI (see .gitlab-ci.yml `version-guard`); `publish-github`
needs it, so a downgrade never reaches the GitHub tap that `brew` reads.

Why the tap checks this itself: a release tag's pipeline runs the scripts at
that tag. Tags cut before the product repos' forward-only guard (ASD <= v1.4.8,
CTXone <= v1.0.13, Crucible <= v0.2.6) rewrite the formula unconditionally, so
re-running one of them pushes an older version here. Only the tap can stop it.

Every Formula/*.rb at HEAD is compared with two baselines; a formula that is
new to a baseline is not compared with it:
  * the previous main — CI_COMMIT_BEFORE_SHA on a push, the target branch's
    merge base in a merge request pipeline, else HEAD~1;
  * the GitHub tap's main (when GITHUB_REPO is set), i.e. what users get now.
    This catches a lowered formula that is already on GitLab main (one this
    job blocked earlier) being carried out by a later, unrelated push.

Ordering matches publish-site-version.sh's key(): v1.2.3 < v1.2.4-beta.1 <
v1.2.4, and anything unparseable sorts lowest.

Deliberate rollback — the escape hatch. Either names the exact version being
published, so a leftover setting cannot wave through some other downgrade:
  * a trailer in the last paragraph of a pushed commit's message:
        Allow-Downgrade: 1.4.7
  * or the CI variable TAP_ALLOW_DOWNGRADE=1.4.7 on a pipeline run by hand
    (Build > Pipelines > Run pipeline on main). Don't set it at project level.
Several versions may be listed, separated by commas or spaces.

Exit: 0 no downgrade (or every downgrade allowed), 1 downgrade blocked,
2 a baseline could not be read (fails closed).
"""
import os
import re
import subprocess
import sys

FORMULA_DIR = "Formula"
TRAILER = "Allow-Downgrade"
ALLOW_VAR = "TAP_ALLOW_DOWNGRADE"
NULL_SHA = "0" * 40


def key(v):
    # v1.2.3 < v1.2.4-beta.1 < v1.2.4; anything unparseable sorts lowest.
    m = re.match(r'v?(\d+)\.(\d+)\.(\d+)(?:-(.+))?$', v or '')
    if not m:
        return (-1,)
    pre = m.group(4)
    return (*map(int, m.group(1, 2, 3)), 0 if pre else 1, pre or '')


def fail_closed(msg):
    print(f"ERROR: {msg}. Failing closed; retry the job once it can be read.",
          file=sys.stderr)
    sys.exit(2)


def git(*args):
    return subprocess.run(["git", *args], check=True, capture_output=True,
                          text=True).stdout


def has_commit(rev):
    return subprocess.run(["git", "cat-file", "-e", f"{rev}^{{commit}}"],
                          capture_output=True).returncode == 0


def formula_versions(rev):
    """{path: version or None} for every Formula/*.rb at rev."""
    out = {}
    for path in git("ls-tree", "--name-only", rev, f"{FORMULA_DIR}/").split():
        if path.endswith(".rb"):
            m = re.search(r'^\s*version\s+"([^"]*)"',
                          git("show", f"{rev}:{path}"), re.M)
            out[path] = m.group(1) if m else None
    return out


def previous_main():
    """(rev, label, range start for trailers) of the previous main, or Nones."""
    mr_base = os.environ.get("CI_MERGE_REQUEST_DIFF_BASE_SHA", "")
    before = os.environ.get("CI_COMMIT_BEFORE_SHA", "")
    if mr_base:
        candidate, label = mr_base, "the target branch"
    elif before and before != NULL_SHA:
        candidate, label = before, "main before this push"
    else:
        candidate, label = None, None
    if candidate and has_commit(candidate):
        return candidate, f"{label} ({candidate[:8]})", candidate
    if candidate:
        print(f"   {candidate[:8]} is not in this clone; using HEAD~1")
    if has_commit("HEAD~1"):
        return "HEAD~1", "the previous commit (HEAD~1)", "HEAD~1"
    return None, None, None


def github_main():
    """The GitHub tap's main, fetched; None if there is nothing to compare."""
    repo = os.environ.get("GITHUB_REPO", "")
    if not repo:
        print("   GITHUB_REPO unset: not comparing with the GitHub tap")
        return None
    # Read over plain HTTPS, not the CDN, so a just-published version is seen.
    url = os.environ.get("VERSION_GUARD_GITHUB_URL") or f"https://github.com/{repo}.git"
    env = {**os.environ, "GIT_TERMINAL_PROMPT": "0"}
    probe = subprocess.run(["git", "ls-remote", url, "refs/heads/main"],
                           capture_output=True, text=True, env=env)
    if probe.returncode != 0:
        fail_closed("could not read the GitHub tap's main")
    if not probe.stdout.strip():
        print("   the GitHub tap has no main yet: nothing to compare with")
        return None
    fetch = subprocess.run(["git", "fetch", "-q", "--no-tags", url, "refs/heads/main"],
                           capture_output=True, text=True, env=env)
    if fetch.returncode != 0:
        fail_closed("could not fetch the GitHub tap's main")
    return git("rev-parse", "FETCH_HEAD").strip()


def allowed_versions(trailer_from):
    """Versions the pushed commits' trailers or TAP_ALLOW_DOWNGRADE allow."""
    rev_range = f"{trailer_from}..HEAD" if trailer_from else "-1"
    values = git("log", f"--format=%(trailers:key={TRAILER},valueonly)", rev_range)
    values += " " + os.environ.get(ALLOW_VAR, "")
    return {v.lstrip("v") for v in re.split(r"[\s,]+", values) if v}


def main():
    sys.stdout.reconfigure(line_buffering=True)  # keep the log in order with stderr
    os.chdir(git("rev-parse", "--show-toplevel").strip())
    head = formula_versions("HEAD")
    if not head:
        print(f">> no {FORMULA_DIR}/*.rb at HEAD: nothing to check")
        return 0

    print(">> version-guard: formula versions at HEAD")
    for path, ver in sorted(head.items()):
        print(f"   {path}: {ver}")

    prev, prev_label, trailer_from = previous_main()
    baselines = []
    if prev:
        baselines.append((prev_label, prev))
    else:
        print("   no previous commit: not comparing with history")
    try:
        gh = github_main()
    except subprocess.CalledProcessError:
        fail_closed("could not read the GitHub tap's main")
    if gh:
        baselines.append((f"the GitHub tap's main ({gh[:8]})", gh))

    downgrades = []
    for label, rev in baselines:
        try:
            old = formula_versions(rev)
        except subprocess.CalledProcessError as e:
            fail_closed(f"could not read the formulas at {label}: {e.stderr.strip()}")
        for path, new in sorted(head.items()):
            if path not in old:
                continue
            print(f"   {path}: {old[path]} at {label}")
            if key(new) < key(old[path]):
                downgrades.append((path, old[path], new, label))

    if not downgrades:
        print(">> no formula version goes down")
        return 0

    allowed = allowed_versions(trailer_from)
    blocked = False
    for path, old, new, label in downgrades:
        if new is not None and new.lstrip("v") in allowed:
            print(f">> ALLOWED rollback: {path} {old} -> {new} (vs {label})")
        else:
            blocked = True
            print(f"ERROR: {path} would go DOWN from {old} to {new} (vs {label})",
                  file=sys.stderr)
    if not blocked:
        return 0

    print(f"""
This push would publish an older formula than users already have, so
publish-github will not run. The usual cause is a re-run of a release tag cut
before the product repo's forward-only guard: that tag's publish-homebrew.sh
rewrites the formula unconditionally.

  * Not intended: nothing reached GitHub. Revert the downgrade commit on main,
    or let the next release write the formula forward. Until then this check
    blocks every push to main, which keeps the GitHub tap where it is.
  * A deliberate rollback: push a commit whose message ends with the trailer
        {TRAILER}: <version>
    or run a pipeline on main with the variable {ALLOW_VAR}=<version>,
    where <version> is the exact version being published.""", file=sys.stderr)
    return 1


if __name__ == "__main__":
    sys.exit(main())
