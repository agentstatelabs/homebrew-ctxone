# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.33"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.33/ctxone-v0.9.33-aarch64-apple-darwin.tar.gz"
      sha256 "9e05f6e134cb66da953fb02fa12dd79414fa6a450196f8c79c80d4ac101212f0"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.33/ctxone-v0.9.33-x86_64-apple-darwin.tar.gz"
      sha256 "1e44aa3c5c677f57076cfcabed231a65c99fad46de729410e7aef6f8b49755c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.33/ctxone-v0.9.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea9b6b5135344827ff4fe3374376a4a5e7eb2470417495c22b0ed19334a3bfbe"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.33/ctxone-v0.9.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e343c1293acef8fa0011a83f7d4f950f7572e54c05f51ca55bcd0b8baa1628fe"
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
