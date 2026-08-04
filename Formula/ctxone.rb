# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.22"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.22/ctxone-v0.9.22-aarch64-apple-darwin.tar.gz"
      sha256 "a2fe8c41e165244ab98c4ddea1acc1cc6f450b8e0b087a7451ca0caa647c7aeb"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.22/ctxone-v0.9.22-x86_64-apple-darwin.tar.gz"
      sha256 "19a68bd8641c8e0ad52dfe10f045aa173ac10950b90b420c82cdb55e57077a5b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.22/ctxone-v0.9.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52e626dc2f5802ec7c3aab868ccb47e215d250215d1d68c5dc6641506bef158e"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.22/ctxone-v0.9.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31e7ed615dda22b1e037cf5efd74b8b91f21c50b91166f7ccbf2d99f7d3b32b5"
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
