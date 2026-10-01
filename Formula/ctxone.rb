# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.12"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.12/ctxone-v1.0.12-aarch64-apple-darwin.tar.gz"
      sha256 "80256d6af1d6c9ad5abdfe15cc3b3058e430eac914be6ad1a17559494f04cd89"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.12/ctxone-v1.0.12-x86_64-apple-darwin.tar.gz"
      sha256 "ed4e0525cd6f655a84e5fde3bd0cddca7e0c50826a734b59240280e3ec3a57b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.12/ctxone-v1.0.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a473ce979a0ac53834c8ef61511710924a05fb83529bc6aecdc33ba4c0997c34"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.12/ctxone-v1.0.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ffc8e528195c715022a6796035386374cc4119dd0bd2fb04636e0bf613732df"
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
