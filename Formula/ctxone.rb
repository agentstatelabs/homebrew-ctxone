# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.29"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.29/ctxone-v0.9.29-aarch64-apple-darwin.tar.gz"
      sha256 "e0b9bd935763e1f0fa6d578afbd1d66f3996acdaa44d88b4207336a5ac61985d"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.29/ctxone-v0.9.29-x86_64-apple-darwin.tar.gz"
      sha256 "c0e04532812bdcdcea9d49fe02c21c13800514c4862ebfb170e5920e98fbec6d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.29/ctxone-v0.9.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1a471761a4862483e0cccbc66e7425ffbc9f429efb2421f62d366dbd656e9f7"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.29/ctxone-v0.9.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61d1cc9d93933964cede4967feb05b732d4cfc01a6e45981dcd83eccb24abac7"
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
