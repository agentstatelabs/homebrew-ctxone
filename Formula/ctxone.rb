# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.5"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.5/ctxone-v1.0.5-aarch64-apple-darwin.tar.gz"
      sha256 "1690baf7f13f324506bd722f6dcd91685e07f3fbf7c83a70f2ebf138876110ff"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.5/ctxone-v1.0.5-x86_64-apple-darwin.tar.gz"
      sha256 "45efe2e35552baa85cac85942c84f22d1a91818829499c10fecc81d4d1864bd7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.5/ctxone-v1.0.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e30dc9602f3cf3cad6ad350ed2cbbcfb55357a33e2e79be1a081dc01f1994fa"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.5/ctxone-v1.0.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf49efa4f2798b71ebc8194392842fd74e490d5103ccee68c8a750191bf8358f"
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
