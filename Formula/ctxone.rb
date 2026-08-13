# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.35"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.35/ctxone-v0.9.35-aarch64-apple-darwin.tar.gz"
      sha256 "7cf834404afcf895aaa7fb8d34939a05b901e60ba1a9bf6c36516e332056cc05"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.35/ctxone-v0.9.35-x86_64-apple-darwin.tar.gz"
      sha256 "3420a37bddb4ade7b8bfc4a5d7b4ffe043c17b4aa21eee8d4652861cdb783c84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.35/ctxone-v0.9.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5075bfb2fa42c9e9f17efca7b4fe72eebce1043dad9cd86c451754bbf2ce1461"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.35/ctxone-v0.9.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c59b48c31ee300294c8b11b6f816844635df2db1d54c7fcd50d57370fdeefc3"
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
