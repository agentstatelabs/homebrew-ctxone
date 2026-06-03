# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/ctxone/ctxone"
  version "0.9.11"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/ctxone/ctxone-docs/releases/download/v0.9.11/ctxone-v0.9.11-aarch64-apple-darwin.tar.gz"
      sha256 "f20b5a2f65f01bfe07cfa4fd237e85c8f22cabf6c177146d1b000b1ddbf9137f"
    end
    on_intel do
      url "https://github.com/ctxone/ctxone-docs/releases/download/v0.9.11/ctxone-v0.9.11-x86_64-apple-darwin.tar.gz"
      sha256 "pending"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ctxone/ctxone-docs/releases/download/v0.9.11/ctxone-v0.9.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "pending"
    end
    on_arm do
      url "https://github.com/ctxone/ctxone-docs/releases/download/v0.9.11/ctxone-v0.9.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "pending"
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
