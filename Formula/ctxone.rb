# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.36"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.36/ctxone-v0.9.36-aarch64-apple-darwin.tar.gz"
      sha256 "9d590a5d52a621a20385c36e653bb9fe9c84d87a92078c79e8bb309a4fe9fd7b"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.36/ctxone-v0.9.36-x86_64-apple-darwin.tar.gz"
      sha256 "ac0aaeb30f889693baf07153a7fc22fe3aa2ad834e4f515a35be0c583e0ea3b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.36/ctxone-v0.9.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1746df6fbe0d9bebe39e579bceaf1b3b20aaab96694a919ffceb5d3c22e0dee9"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.36/ctxone-v0.9.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e66868ad39b838ee51d6c33f7559508389691b686072398cd2ce7627a9826b48"
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
