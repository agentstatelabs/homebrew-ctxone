# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "0.9.41"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.41/ctxone-v0.9.41-aarch64-apple-darwin.tar.gz"
      sha256 "f2c5f775e386c705f1fd45c433932849d62fd3b0235e171f99584a583c419b31"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.41/ctxone-v0.9.41-x86_64-apple-darwin.tar.gz"
      sha256 "7051008536279549d43ac9dd9cf309d0aac13c3e5a7b8daec9b79c933173876f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.41/ctxone-v0.9.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f6bca6e16121d7591bb5183e07fe1947935cec9148168e249520f4dc58ef4f2"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v0.9.41/ctxone-v0.9.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a82f199ba302072567ef11d875dfb9e1bfd165323dbcfc57d2a7164246147ca9"
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
