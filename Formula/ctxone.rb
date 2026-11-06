# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.2.2"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.2/ctxone-v1.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "4af6cfae2f6480553b12ab5b509bc231965a7a206803571d87721d6e0b9cd23a"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.2/ctxone-v1.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "6d24d7e294984ba7948e3fc26000f4f18213a7ca41ada52c73beb5609801ea02"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.2/ctxone-v1.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0521d4c841a33a010b3f95b1da7d83086a4ed0948e32bd51b21b35e31febbd19"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.2.2/ctxone-v1.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2809abfe4835e360e6c65697c9bb24ad8b0dec054f23da28c48ff3ba42c60ebc"
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
