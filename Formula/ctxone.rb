# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/ctxone/ctxone"
  version "0.76.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/ctxone/ctxone-docs/releases/download/v0.76.0/ctxone-v0.76.0-aarch64-apple-darwin.tar.gz"
      sha256 "7cdccd03320c46f915debd83160d629128d0e4aa49d72a14431bcc7fdb5b6312"
    end
    on_intel do
      url "https://github.com/ctxone/ctxone-docs/releases/download/v0.76.0/ctxone-v0.76.0-x86_64-apple-darwin.tar.gz"
      sha256 "5370802d7f6c28863d3b31cd2f993220d9771e219c1b1cb322896632013ef9e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ctxone/ctxone-docs/releases/download/v0.76.0/ctxone-v0.76.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "pending"
    end
    on_arm do
      url "https://github.com/ctxone/ctxone-docs/releases/download/v0.76.0/ctxone-v0.76.0-aarch64-unknown-linux-gnu.tar.gz"
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
