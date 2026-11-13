# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.3.2"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.2/ctxone-v1.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "549c80e9ef1c91834249da5e1efb9e33df1f9ae7bccd3ab210f7ad5a303fc37f"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.2/ctxone-v1.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "804fee25e95db7d8a287e9fb235e36b5520edb0f5bb77feefed728d4d81eb4a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.2/ctxone-v1.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dfba911caace0c0b7419d7bbf988d117e39cc943514456cc885ad22a0882be42"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.2/ctxone-v1.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "787df345dbcf78d5b29ce98b5762e2e3c1b5d1f9ca39fb39e7bed6362eb50c40"
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
