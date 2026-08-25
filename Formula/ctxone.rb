# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.7"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.7/ctxone-v1.0.7-aarch64-apple-darwin.tar.gz"
      sha256 "5e52d83b74ddea1281f13556de1f76f32f6a81721a725402167810e01936e234"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.7/ctxone-v1.0.7-x86_64-apple-darwin.tar.gz"
      sha256 "fba01fdae7d9f0822c17af1db53bf9033d0315504dd60618124c4dd2782b174d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.7/ctxone-v1.0.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd7f2bc69606e05369243acba0bb9c0a1c095ad8f2f1b251592d677fd74c43e5"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.7/ctxone-v1.0.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71b73efb3d332d8da961a300700743c91859f497a9250927f893994368d7de9c"
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
