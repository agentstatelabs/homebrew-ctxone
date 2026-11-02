# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.2.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.0/ctxone-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "706f542038e8daa52b6c6f8ad4ae167e1e44938dd955cec7e2add78274374ddc"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.0/ctxone-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "70b77ef5e14ea6d58f0793a6043e42fbed422a116a742aa9bfcf5e51639f9be1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.0/ctxone-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9d9913bebc00c7d762b5f5b4119ac35561f82e6f1552ea97acf71668c81df1f"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.0/ctxone-v1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9cf12456e21bba869e38f9717ea6a4c198acaf6a1932693a358994031a63e277"
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
