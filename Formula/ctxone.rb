# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.15"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.15/ctxone-v1.0.15-aarch64-apple-darwin.tar.gz"
      sha256 "0f09a61d8499cd48e4d3370f958fccce5b94392f4ecbd878d9d8bf4b03b2f04d"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.15/ctxone-v1.0.15-x86_64-apple-darwin.tar.gz"
      sha256 "c254ec76306c0d12d9fef028b98c4cc9d038c03635df636843e6eba62d4a54e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.15/ctxone-v1.0.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56b11dfd088e08cefb8752c730c74324072fa49f3df2f8de29d51075dee049d9"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.15/ctxone-v1.0.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5da6bb337aab77aa0f1c89c0f2d110e3adae61bbd9373001b8769f9fa1f63ab7"
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
