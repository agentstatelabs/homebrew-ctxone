# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.25"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.25/ctxone-v0.9.25-aarch64-apple-darwin.tar.gz"
      sha256 "bada98f7afb2045f31cbfa7d5c4c05637f6c796ef0b5979201dd93487eb4f155"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.25/ctxone-v0.9.25-x86_64-apple-darwin.tar.gz"
      sha256 "bad3e60f798686f3a0d94bd3556c588f85897bfdf6781745bcc076a65497e7d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.25/ctxone-v0.9.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65760510621ba155fcb2d46d3274b547560d15fb673eba15246238d1bfe1b0b1"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.25/ctxone-v0.9.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e38edc12ddcde5a6b71c58b85db9cc170c198fd47e4f8651ebfd7effd770045"
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
