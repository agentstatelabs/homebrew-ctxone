# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.6"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.6/ctxone-v1.0.6-aarch64-apple-darwin.tar.gz"
      sha256 "b8bbfc9c48e2f4fe7f1c0ef302a8f2558d96b17c48512fa77aec82f2bceeadab"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.6/ctxone-v1.0.6-x86_64-apple-darwin.tar.gz"
      sha256 "412d40929e0f1eb42edeadb4c71c1df6ef1e0a8f1de077948c350c353e41c778"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.6/ctxone-v1.0.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2febb957902a5382bb835fe603d9586ff557df5049ca6391bbd264793d5f92d"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.6/ctxone-v1.0.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1df8fdf60d96969641e4ce89a77cd48cf356d3b8a8e0c440d806e139f0bb022"
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
