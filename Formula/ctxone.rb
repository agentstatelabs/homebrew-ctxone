# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.8"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.8/ctxone-v1.0.8-aarch64-apple-darwin.tar.gz"
      sha256 "2b72eeaa10d3636e7fe8c7e946345025cb7b6ccae04f8d9f051bee8241ba25d2"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.8/ctxone-v1.0.8-x86_64-apple-darwin.tar.gz"
      sha256 "b74a0a6bc86ddf6b6df53b1bc63463686cce667d5464f6876b3aa686af99fa5a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.8/ctxone-v1.0.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37ebd5e8c2f4f5a72248c36feeca9aece93f9d1512bba80447063363b9653c6f"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.8/ctxone-v1.0.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "053d1c0f499a5172dfc52fc0d8e06666ab1df82e98d4d88cde2dd90604e0253b"
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
