# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.28"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.28/ctxone-v0.9.28-aarch64-apple-darwin.tar.gz"
      sha256 "23088a018d946e59e6fe2f2ec25614bcdad1967fcb320eb68d065151cdd97577"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.28/ctxone-v0.9.28-x86_64-apple-darwin.tar.gz"
      sha256 "4eb207c8095d5f4ff6f84404921ccf7e834cb4f45b4258a49a44fc2eb8b49dc3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.28/ctxone-v0.9.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44d8222cc8a7f79fb8f849fe2803a1bda12449c361b48152a38cef207c7507fc"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.28/ctxone-v0.9.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1868de3d78f337523211bae474f9f4392901cc3c07b3b24847871a6eefb7771"
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
