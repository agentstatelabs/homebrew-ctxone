# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.11"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.11/ctxone-v1.0.11-aarch64-apple-darwin.tar.gz"
      sha256 "ca705022a8b8404d2b520f6597597d1cbbb7360d6183e94b49c61ce390302694"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.11/ctxone-v1.0.11-x86_64-apple-darwin.tar.gz"
      sha256 "e773dd1de2995a34bdd73305f7cccfce3210e3c040d7a820ad4fc19219ffb577"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.11/ctxone-v1.0.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f71e1e679389a02be6ce27f055573e5fd4abeb9b31f30dafeb6c9b9b7a53733"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.11/ctxone-v1.0.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4bde83ffea8b4b829621477e9661699780f9a493ecbb328d4a9d766f205eb86"
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
