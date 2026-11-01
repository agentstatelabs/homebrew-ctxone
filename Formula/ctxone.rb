# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.1.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.1.0/ctxone-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "5e75cc47819fae1508bf87485eb8940f17837caeb7c6d438bc4275a42f548afe"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.1.0/ctxone-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "ca01e8b7098bdf480e95c12970dd1d2f7c55f14b6e342482b01f03da1e273cd1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.1.0/ctxone-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "285883236a1c273a8d14325be692d0648a9c859f7caf223ae3978bcb380ec6f8"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.1.0/ctxone-v1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3b3f389dab3be1709749be689d472a3ee5018b403b0a3d8a202f31013d72f27"
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
