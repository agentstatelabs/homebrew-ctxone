# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.46"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.46/ctxone-v0.9.46-aarch64-apple-darwin.tar.gz"
      sha256 "4a19da4cb7ad85f1e2c3a6ba1afd4a61b9a350cb9e925e0bc621ffc7606264b9"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.46/ctxone-v0.9.46-x86_64-apple-darwin.tar.gz"
      sha256 "48dec1dce6b6f1fce62a1ed820ff6379f5adf74822e3e8a68ca462cf2f2e76af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.46/ctxone-v0.9.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0007a91e9b9783f5250ad8861b7d275237ca577e2ba4176ea8c9a7559114103"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.46/ctxone-v0.9.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25f85f13ae5b0294a9747886a13c4e4c111d8589c06891442ac1bf79ad5d5eef"
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
