# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.43"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.43/ctxone-v0.9.43-aarch64-apple-darwin.tar.gz"
      sha256 "40476102dc34aec4dc7ed28b529e2a702d9b724762b5d8b9fe757348d4aad03c"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.43/ctxone-v0.9.43-x86_64-apple-darwin.tar.gz"
      sha256 "342039536778e159aef001b35bdce5f4cf36d886425b598c74d15ffe1f6b630c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.43/ctxone-v0.9.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc3da01e45920eb9c129471eaaca2b797301509043a03066da91e504eb293afe"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.43/ctxone-v0.9.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8cf799966a93a3e76f057a15b3b889c1a8c9e9ab17edb4213b067ea9d07f0c1"
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
