# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.26"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.26/ctxone-v0.9.26-aarch64-apple-darwin.tar.gz"
      sha256 "3ded1e054d4a328fb1afd90e62bbb8287b2af23610426ed8d25d391a17f13788"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.26/ctxone-v0.9.26-x86_64-apple-darwin.tar.gz"
      sha256 "31cdc9150902f0cfc373f97f2f19d1a533841a62ad73cb3bd5705fdf87a6798e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.26/ctxone-v0.9.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c15b3bcb37e524ab6e098e3b91b9b17f13c37e1c72a3719d1a4163906cb7bc28"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.26/ctxone-v0.9.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ddcd133f49a6f9c43ce7aa05c711ca6881f4d81c7ea0e0cc0836f287b1b17a4e"
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
