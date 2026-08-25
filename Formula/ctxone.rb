# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.4"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.4/ctxone-v1.0.4-aarch64-apple-darwin.tar.gz"
      sha256 "74ad4f917483e4a31b738c7af56e000e0dfeea266977d3f8712b99c7ba83f7b7"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.4/ctxone-v1.0.4-x86_64-apple-darwin.tar.gz"
      sha256 "5eaad28a7b06eef426addd64f3eeac4710c6b2d2df15d66f61e1f2dde83269c7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.4/ctxone-v1.0.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a60b8a8b4d0f42eb6cc62cdf918980179362f5ccc4263eab22b602bc93e0f6f"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.4/ctxone-v1.0.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d39d32408bdd5af48c23ca8e8a3c8b9586773c1e64dbd18b73fc62e80fe3e0b1"
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
