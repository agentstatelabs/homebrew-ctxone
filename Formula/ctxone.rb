# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.0/ctxone-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "19f41426bce1053600ca807b173221c41baef68e789fc44361f9b7e5ac00d09c"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.0/ctxone-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "77380526eb32ea43d83ab90a016407973b191c4c7643ecff3fd44903fb1558dc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.0/ctxone-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea5e553c688c9f17374f8383c93d12a62c345f6a70b18daa7259ddc7170a5ad4"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.0/ctxone-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a03ea71b68f3d1dbc12a6ad996d1b1289d2a60cbb9820d4292f7fe151b9810ce"
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
