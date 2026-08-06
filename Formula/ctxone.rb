# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.27"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.27/ctxone-v0.9.27-aarch64-apple-darwin.tar.gz"
      sha256 "fed383452ca785467f5cea84ec6b8c2a613bd3d7c10a548b268100d62234b512"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.27/ctxone-v0.9.27-x86_64-apple-darwin.tar.gz"
      sha256 "5011cfd459b0c3c296aec764bdbc39da588e1a2ba5bae2d0fa375bfa22915758"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.27/ctxone-v0.9.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e79b03897824847dd885c66c66c1ddc1cd554ce80e3c96d0eeb6751e12818c3"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.27/ctxone-v0.9.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec58c9543559392c244145ae4ea79b7b88d10ce6770c656928eab548795ed1d1"
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
