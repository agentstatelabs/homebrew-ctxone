# frozen_string_literal: true

# CtxOne Homebrew formula template.
#
# The release workflow renders this template for each tag by substituting:
#
#   0.75.1               — the release version (e.g., 0.60.0)
#   https://github.com/ctxone/ctxone/releases/download/v0.75.1/ctxone-v0.75.1-aarch64-apple-darwin.tar.gz      — macOS arm64 tarball URL
#   7a112451a2d2b21ee498ea88ac1fde083177acc91620d17c67275200bd97bad5      — macOS arm64 tarball sha256
#   https://github.com/ctxone/ctxone/releases/download/v0.75.1/ctxone-v0.75.1-x86_64-apple-darwin.tar.gz     — macOS x86_64 tarball URL
#   f0be5877cc72fdfe290167c0107bb00640785f41358e5fbf23e0f439bd9bc15e     — macOS x86_64 tarball sha256
#   https://github.com/ctxone/ctxone/releases/download/v0.75.1/ctxone-v0.75.1-x86_64-unknown-linux-gnu.tar.gz      — Linux x86_64 tarball URL
#   41bad1493c6b1c05a0287f3680bd12c127da34da89699d115a260408ea79f191      — Linux x86_64 tarball sha256
#   https://github.com/ctxone/ctxone/releases/download/v0.75.1/ctxone-v0.75.1-aarch64-unknown-linux-gnu.tar.gz       — Linux arm64 tarball URL
#   89eef309b1f35aa269a55e6d1001446bea175a868e275df52dff5103d64c2125       — Linux arm64 tarball sha256
#
# The rendered output goes to ctxone/homebrew-tap/Formula/ctxone.rb.

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/ctxone/ctxone"
  version "0.75.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/ctxone/ctxone/releases/download/v0.75.1/ctxone-v0.75.1-aarch64-apple-darwin.tar.gz"
      sha256 "7a112451a2d2b21ee498ea88ac1fde083177acc91620d17c67275200bd97bad5"
    end
    on_intel do
      url "https://github.com/ctxone/ctxone/releases/download/v0.75.1/ctxone-v0.75.1-x86_64-apple-darwin.tar.gz"
      sha256 "f0be5877cc72fdfe290167c0107bb00640785f41358e5fbf23e0f439bd9bc15e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ctxone/ctxone/releases/download/v0.75.1/ctxone-v0.75.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41bad1493c6b1c05a0287f3680bd12c127da34da89699d115a260408ea79f191"
    end
    on_arm do
      url "https://github.com/ctxone/ctxone/releases/download/v0.75.1/ctxone-v0.75.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "89eef309b1f35aa269a55e6d1001446bea175a868e275df52dff5103d64c2125"
    end
  end

  def install
    bin.install "ctx"
    bin.install "ctxone-hub"
  end

  def caveats
    <<~EOS
      CtxOne is installed. Next steps:

        ctx init          # Auto-configure your AI tools (Claude Code, Cursor, etc.)
        ctx serve --http  # Start the Hub (port 3001)
        ctx demo          # Seed demo data and see live token savings

      Docs: https://github.com/ctxone/ctxone#readme
    EOS
  end

  test do
    # The binary should at least report its version
    assert_match "ctx", shell_output("#{bin}/ctx --version")
  end
end
