# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.10"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.10/ctxone-v1.0.10-aarch64-apple-darwin.tar.gz"
      sha256 "b8009c41c2a251628ec8d347bb72575c3324c9268c9f0eb4f25908ee2e50c279"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.10/ctxone-v1.0.10-x86_64-apple-darwin.tar.gz"
      sha256 "0f00e4faa1e01f8a67a51576833027f08e37a0c51909bcf74fe3ed5aeec207f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.10/ctxone-v1.0.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e32c0feb99640831e6409495a128940cb507e68381d9ee10b2d50da879fac6b"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.10/ctxone-v1.0.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4fa4da6b8361b837473be303bbb82d42bb05bd1952361918388ade9b2cc2fe7e"
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
