# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.3.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.1/ctxone-v1.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "29b4669ce062aaf3d5d7a607672cb038dc72322b31590642912b901df24a43c4"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.1/ctxone-v1.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "fee58d7526c8c80aea2ab89e1afc03a1771c289dfc0df8f0d5bd576decef453b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.1/ctxone-v1.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b2ebd33fec5863fa1111a9b9670204d55cfa5e0de43eafc451c67fc56f7e54e"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.3.1/ctxone-v1.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56125028070937cd0aee666c40ce617d765857c13401e96574c21fb2e03d23b7"
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
