# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.14"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.14/ctxone-v1.0.14-aarch64-apple-darwin.tar.gz"
      sha256 "02ce06a68fac3fdf847864217339540798fa10f61a27e12f05c2071869f125dd"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.14/ctxone-v1.0.14-x86_64-apple-darwin.tar.gz"
      sha256 "0c3afa5076ec8019bb4ecaf9770007a389f8bb8612497fe48e0f00ef87419697"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.14/ctxone-v1.0.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99f47008ed305a169cab0c1e3d2e1a033f86e9c36eb172976c753cbad27b08d1"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.14/ctxone-v1.0.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08615f9a539d4fdad2444fc0e86fdadc37e1b69e79f6d03ad99c54c8379207ca"
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
