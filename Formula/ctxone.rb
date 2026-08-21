# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.44"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.44/ctxone-v0.9.44-aarch64-apple-darwin.tar.gz"
      sha256 "41e2b1bb9e90ef4d2a1bf1b6ccbeb18673e7cc59f9d83abbc05824a66f0894ef"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.44/ctxone-v0.9.44-x86_64-apple-darwin.tar.gz"
      sha256 "932f307db411e59b666ad08820e442ce60df7656c44e567a7da047285d112143"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.44/ctxone-v0.9.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "daac9985700010318ef49e717247efca969167486fde9c97eab31d92d7d2ecff"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.44/ctxone-v0.9.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a96fef6ad37717af224a6dd53dc068440af2fe5a8d5b59038ad1b3cd36c82b97"
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
