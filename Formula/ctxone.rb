# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.34"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.34/ctxone-v0.9.34-aarch64-apple-darwin.tar.gz"
      sha256 "02c4544564b29f226b3fec892c6b4cfa1a54fcddecad359181333bfb7c3a17bb"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.34/ctxone-v0.9.34-x86_64-apple-darwin.tar.gz"
      sha256 "5d2dc979b00ddf807089894e11ea0071805db77aaa0adc9a36af8d1afbe7dafe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.34/ctxone-v0.9.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf9dd236c9d1cb4c29bbe3a65ab48eb09b1b4e1e64c6589fb699f5ad371d002d"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.34/ctxone-v0.9.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b681186ba6560effcd164945462fc84c79cf1761a839273ea781352347ad09a"
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
