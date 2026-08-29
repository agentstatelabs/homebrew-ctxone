# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.9"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.9/ctxone-v1.0.9-aarch64-apple-darwin.tar.gz"
      sha256 "b21a4fe96072a7390ddd56c5b0e620044d6b4d9f0e4b8d145ade12ef6ab79ed8"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.9/ctxone-v1.0.9-x86_64-apple-darwin.tar.gz"
      sha256 "5d292c386b39ff19824cd405b33da98785e3f050586b88f1a0cdf2cfea176761"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.9/ctxone-v1.0.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5ff889e382f7faa43d356beb2acf8becf4a08e4cd82bb19f58e208c11f428e0"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.9/ctxone-v1.0.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "215fca752cdc59d7314d26b5347ac6dc7c3c8a12ad8a447acfb630820a5c4ef2"
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
