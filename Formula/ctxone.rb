# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.42"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.42/ctxone-v0.9.42-aarch64-apple-darwin.tar.gz"
      sha256 "b89bbb25ae144fb381c234adad24f8294215cdee31a4bda69d02b2ac070c56c9"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.42/ctxone-v0.9.42-x86_64-apple-darwin.tar.gz"
      sha256 "b4341824e532344b2918a1ad22c963ce54c592d389fb7e6a7c252c65a13c81e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.42/ctxone-v0.9.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ca33e9ad2caf855afd8c7d5af3b89841f0d15b4012ecb88388e157082d92388"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.42/ctxone-v0.9.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5324a026176597480e0ed606416c24f3624fed985972bd89103c2787862eecc"
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
