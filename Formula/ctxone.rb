# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.32"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.32/ctxone-v0.9.32-aarch64-apple-darwin.tar.gz"
      sha256 "be798dfd5c0cb3701a6e9657270df38e0b51a8f962cc7ed2c662b969d7f957d1"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.32/ctxone-v0.9.32-x86_64-apple-darwin.tar.gz"
      sha256 "5920ec23fec1ca3569ae206823b746f5cd96631673a2d862fce30607bffb1f26"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.32/ctxone-v0.9.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3842aad7844595e3d6e460f176f5316f13bc4dcd974401640293e93459669eb6"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.32/ctxone-v0.9.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f3d98a50bf38ec8b5ff96856ef087f4b5338dc2c7e1e93169d900258846c201"
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
