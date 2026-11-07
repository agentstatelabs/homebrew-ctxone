# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.3.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.0/ctxone-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "a86a703f2c5cee0abe117380b80808d168fc531aae4fa51c309ed734931513fc"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.0/ctxone-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "fe1302fd4e7dec47f03299919c8984d7e13cd80c3134c11dbc1c9bb7adda73d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.0/ctxone-v1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98cad780c55986c4a06ed0b0714065c49a453e321880d5c2158c485d7b58ae2e"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.0/ctxone-v1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "975f297ad468b72e4cae1c814cebb94ba2544c85cf118f357a14ed423a0652c8"
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
