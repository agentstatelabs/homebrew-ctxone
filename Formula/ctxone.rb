# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.45"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.45/ctxone-v0.9.45-aarch64-apple-darwin.tar.gz"
      sha256 "ef10eec6700f7ba8f1bb6d40d4acdbf7fa37a9a6340b00a612bebd9ba6c7acb1"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.45/ctxone-v0.9.45-x86_64-apple-darwin.tar.gz"
      sha256 "7346fdfab551ce3524773df035cab949b72ba8e87ce211120d55dbfd96a8c318"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.45/ctxone-v0.9.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77976577c104c9cdcd34ce8bc012167ff9b32fa78f1bb43a5d603b85b3a0b3a5"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.45/ctxone-v0.9.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db622f5271982fa9b5aeaa5376926b1dee57f02409496b45f089891cee4fcc42"
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
