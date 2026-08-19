# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.40"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.40/ctxone-v0.9.40-aarch64-apple-darwin.tar.gz"
      sha256 "1693dc2e6e22b0c2be69ac5e3a62d4f004d3e88ee5fb7136bfcbd4848f52c557"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.40/ctxone-v0.9.40-x86_64-apple-darwin.tar.gz"
      sha256 "a52e0fb02b4262acc19e35cec61d7c0140c1572629df88f1b7c415aa949b2556"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.40/ctxone-v0.9.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5df06ede729e5c6ade7d5336bc88194e17643183a7ca214b7f405b8b96066f9"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.40/ctxone-v0.9.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5be4646f02c054d4c5c732af2a127ebc2026c67f20516b281574f20161f9998a"
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
