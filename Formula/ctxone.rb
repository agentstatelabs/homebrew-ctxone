# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.13"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.13/ctxone-v1.0.13-aarch64-apple-darwin.tar.gz"
      sha256 "1084ef308c9c1dcba0319acacd999d7cd50fddefcb26b3b64426abda74154355"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.13/ctxone-v1.0.13-x86_64-apple-darwin.tar.gz"
      sha256 "50c73c80f4b5e75ed1e784f586d79276ccc3861881c643ee7c7bdc9ca0b960c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.13/ctxone-v1.0.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8532adf7a8bdd4a7d35baa97cbae9520b44841a08238a4f8f9a5b96d83209536"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.13/ctxone-v1.0.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91d18be87e92e5ed6fe0e4154612d54dd335937439ad2669ca642c1686c5333d"
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
