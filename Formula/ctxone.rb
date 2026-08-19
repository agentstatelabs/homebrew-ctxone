# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.39"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.39/ctxone-v0.9.39-aarch64-apple-darwin.tar.gz"
      sha256 "08115f381d85e52f8db794a1e464b5fb7a38b8e2a5e461870c7f06ab5494b47a"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.39/ctxone-v0.9.39-x86_64-apple-darwin.tar.gz"
      sha256 "24f93a6a4e0cfdc01b42cfdb77a01970164aa10e7b271134dde32eaa8a0671dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.39/ctxone-v0.9.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b206dddd2884d139f8d1f5234d2576d77d6c89abd20911fa3a6610c180a3bd9"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.39/ctxone-v0.9.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "98e9243eef9dfec0f1157f86dfaf71eeb60a026615c0e5bed3aeb00f7fd7ffc3"
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
