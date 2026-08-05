# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.24"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.24/ctxone-v0.9.24-aarch64-apple-darwin.tar.gz"
      sha256 "9e549b844a325b522def8bceb59652036ad9ce3cf248b455fbc2c58f0bd681cf"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.24/ctxone-v0.9.24-x86_64-apple-darwin.tar.gz"
      sha256 "73facf1abe21482c610fb4854af16a3c02807ac1adddb9b1ef5686918d8508fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.24/ctxone-v0.9.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a927f0a7310f14c2815cd0cd5279baef7a48b3db388a3e075843c3b23f57c50"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.24/ctxone-v0.9.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "489d194827f2660774c443bdb9e0fb61373ac75b7b0c8f64359beb45e2ed1d32"
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
