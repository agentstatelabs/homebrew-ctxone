# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.2"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.2/ctxone-v1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "9340f6abf3821c458509717f66f602d5c3bb84166e243f8af658d5e7adac4167"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.2/ctxone-v1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "ac1c9e8dd72a612f1336bf26ef361cb24065704f5d50083e70bcdc24a2e89777"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.2/ctxone-v1.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db876202a2d19baa971bb97b0caab36b90a5018a29140dff04b2feb25ba212ea"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.2/ctxone-v1.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9df4cc5743c5822a8f359301fdf3c5ed55e24b5f1568e226f552d541d3d18ba0"
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
