# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.38"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.38/ctxone-v0.9.38-aarch64-apple-darwin.tar.gz"
      sha256 "3d4933a8a46e9b6c6c3a53effb2c96dfb1eb7c9ceaffb2f9e56aa240fc0406ae"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.38/ctxone-v0.9.38-x86_64-apple-darwin.tar.gz"
      sha256 "ee75bd8ec103bff224461938dd0edc2587e2db68f685365d1c2ef9c6793f0e77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.38/ctxone-v0.9.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bfccddc0fcd0afc7c40516dade44a75cfecfaa1600b2e1fd3eada7816fb6e45d"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.38/ctxone-v0.9.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a51d26a60f75677256cb6a1d909caa11e8f69446176b6636a3e95ed0b82db95"
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
