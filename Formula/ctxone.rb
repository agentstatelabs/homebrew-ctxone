# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.21"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.21/ctxone-v0.9.21-aarch64-apple-darwin.tar.gz"
      sha256 "bcf525aeaea31042d69ec3808e7d904bf39955748f91f6afa3a0e09ce9bdc809"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.21/ctxone-v0.9.21-x86_64-apple-darwin.tar.gz"
      sha256 "ad895b7cbe2202a7c6f65d2e571a2ae6773c300557543bfc16c686e2f00a4761"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.21/ctxone-v0.9.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a51e185ed80bad7418921a3e9cdef7c0f2db969252e626a65f3a0c491cb3ae4"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.21/ctxone-v0.9.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16884bf496c806149841d2b5a4306c04d89ca399364f84afb5d8ffa3a3ebf578"
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
