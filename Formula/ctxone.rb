# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.23"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.23/ctxone-v0.9.23-aarch64-apple-darwin.tar.gz"
      sha256 "c166290cfecc0fa5906be89b0b8589efe92a48174fa1b84d9067ec749638b421"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.23/ctxone-v0.9.23-x86_64-apple-darwin.tar.gz"
      sha256 "a1cc88638fd2b7b62a8edba140ef13f5286b5b923f75503625d5a99d6d4f8999"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.23/ctxone-v0.9.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8183ecc94c81d87791cd620586b6980648e905d0290ecccef0035e7c62d81e67"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.23/ctxone-v0.9.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9d30e5b037eb8f1a89700aead6d3438354e7b07dab3e804f277fec552ad84a2"
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
