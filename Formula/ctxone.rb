# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.37"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.37/ctxone-v0.9.37-aarch64-apple-darwin.tar.gz"
      sha256 "25e5072ef3494925fcf64242700d34b1cdaffc227a2f559f96a0be9957d37fd3"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.37/ctxone-v0.9.37-x86_64-apple-darwin.tar.gz"
      sha256 "95e5f0896c93d1813311a9f5fb50130f43d0a5fc240f69e51ad8c9245aaa7645"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.37/ctxone-v0.9.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cedc89610c0101d5bfbd6663e898ee3b9c309f92391841bed7a5ef0e168559d9"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.37/ctxone-v0.9.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "429000c0841c85338773c0d7a4ce2e176a3640a0399fbbe98ecdde480cf79f55"
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
