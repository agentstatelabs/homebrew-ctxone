# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.31"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.31/ctxone-v0.9.31-aarch64-apple-darwin.tar.gz"
      sha256 "82ccf70a59ee262298edc455b560c9e73e7b94c4bd8868f5e055b0d8a9ab3f4f"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.31/ctxone-v0.9.31-x86_64-apple-darwin.tar.gz"
      sha256 "42d32e6d0de5c49bc554aacc184c5050e0ba20906928476f4825ff9404a9eae8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.31/ctxone-v0.9.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9145e0b455755768edd5e826286bd9147c81479bd5ad96e5789262831b026252"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.31/ctxone-v0.9.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad6ae89d9ab53549b15dd0801c01e6e329163e480887d369d07b9dd9edfc6f64"
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
