# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/ctxone/ctxone"
  version "0.9.14"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.14/ctxone-v0.9.14-aarch64-apple-darwin.tar.gz"
      sha256 "7a8b987f7e7b0de0d42629269765a3c44aee3d0b7e43e0af403d0ecf3a8ef084"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.14/ctxone-v0.9.14-x86_64-apple-darwin.tar.gz"
      sha256 "e718b70b7677061c3d6ff86f28c3e95694e526d7d9427fb88a9dece1dfe17c29"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.14/ctxone-v0.9.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9a8da67124eccdb331e6902943748865cc75cfc3d9ea5abd8137a49462d551a"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.14/ctxone-v0.9.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c4bb8a5c12f3dadfd4b7ec1e8051f0d321e74ab250afd5157f57159f577218a"
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
