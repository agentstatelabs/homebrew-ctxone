# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.2.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.1/ctxone-v1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "59ff1333055dd17b6ac331b5b73dc02cf8659f4029de9c46373fc0c0a5927f9f"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.1/ctxone-v1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "a3d4c12490192bc6ae90c18fd12e02b4490441f2a8260b947f6796f87d20151f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.1/ctxone-v1.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0de9166bebc95c46ac833e741b9b4d4c4b95347dc2cb4b78cf29b4c1fdd6c04"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.1/ctxone-v1.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c5fa30fcc0a58941f675e51c5d960b68f0f2cde2da241d9e655577d289a49d6"
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
