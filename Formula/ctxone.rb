# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.15"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.15/ctxone-v0.9.15-aarch64-apple-darwin.tar.gz"
      sha256 "406e7c4a0d16e6634a0f2e851ed80497feb194aa44806bddcc1059ffc7b5fbc5"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.15/ctxone-v0.9.15-x86_64-apple-darwin.tar.gz"
      sha256 "5839af349982f6e3e528ad9b13740c45c322b6e350ee6606357c572971d5da3e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.15/ctxone-v0.9.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5865a9a21c7a2d9a4a81235312923ea311da01bb5786a99d88ed6b5165858ad"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.15/ctxone-v0.9.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95a9668fb67446b18c381f1ab673142951b214c57b3b883ea33063350f3aab7d"
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
