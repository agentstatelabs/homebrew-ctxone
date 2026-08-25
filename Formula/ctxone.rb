# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.47"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.47/ctxone-v0.9.47-aarch64-apple-darwin.tar.gz"
      sha256 "1a21640c779e23b29d5742beaeda37f25e0855f3119096e236cd4105405aaf9d"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.47/ctxone-v0.9.47-x86_64-apple-darwin.tar.gz"
      sha256 "f878d2ce9b32f8ec3c29fa4ebf85ae49f160f3f6efa4475a969b506b40f452e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.47/ctxone-v0.9.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb8989f32ca2e79f91ed1b60c80fc62d1a3c2fc013871e88d21e8a45e9235aa0"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.47/ctxone-v0.9.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f64c6979887ddc6ddc1e843d13c29f409681d2fdb9822fcebffb36ddc6d36390"
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
        ctx serve --http --lens  # Hub + Lens web UI at http://localhost:3001
        ctx demo          # Seed demo data and see live token savings

      Docs: https://ctxone.com
    EOS
  end

  test do
    assert_match "ctx", shell_output("#{bin}/ctx --version")
  end
end
