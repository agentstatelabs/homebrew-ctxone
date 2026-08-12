# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.30"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.30/ctxone-v0.9.30-aarch64-apple-darwin.tar.gz"
      sha256 "7f9cf06703219ffee9d629f3487942b52dd085118e0909321226a10deab094d2"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.30/ctxone-v0.9.30-x86_64-apple-darwin.tar.gz"
      sha256 "836a1b2fa2d8e2ea6cbcdfba8896e8096c5fdee4eb2032273c2df99dbace47c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.30/ctxone-v0.9.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eaae86fb998d1924ab6bb1beac9691845f4d9ada754813a861bfc16cca92f4e5"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.30/ctxone-v0.9.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc195375cf80857e72984a597f2a863ea0261c3b13a5747516003d661783e117"
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
