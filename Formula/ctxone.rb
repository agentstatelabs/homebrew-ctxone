# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.16"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.16/ctxone-v0.9.16-aarch64-apple-darwin.tar.gz"
      sha256 "9096058008efbc43d2500f7b1b62bd3f1bfd60a1446683a6616fd23eaf6eb159"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.16/ctxone-v0.9.16-x86_64-apple-darwin.tar.gz"
      sha256 "7d7b36f078e114ea121e313b252b94ef6c00d9b999afed63117fc8f7b5dfd72d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.16/ctxone-v0.9.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0574d1d17bf55461e022ce7bea5100024ea1e396add3e6366e5c89b96f59fcf"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.16/ctxone-v0.9.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70417a53f324c6c0a01436f2e960f962355b89e960d92d302eccb2e22de49a44"
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
