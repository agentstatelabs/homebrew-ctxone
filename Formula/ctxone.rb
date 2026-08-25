# frozen_string_literal: true

class Ctxone < Formula
  desc "Persistent, searchable, accountable memory for AI agents"
  homepage "https://github.com/agentstatelabs/ctxone"
  version "1.0.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.1/ctxone-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "a20c35328574bba771a736dbcf41d34c1a0770fe21c339d5fe86fb65fd352f57"
    end
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.1/ctxone-v1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "680d375a93334fb23c0170b54bdb020947e8354eed4591dcc1424e8372a204fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.1/ctxone-v1.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d4952958efdef38bb3d5abeb66e349d3e48b539ffc4505028287031c28b157f"
    end
    on_arm do
      url "https://github.com/agentstatelabs/ctxone-releases/releases/download/v1.0.1/ctxone-v1.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc8a97be1db91911dfe75f1f5d04965b51e4c20f4a24be3ba6e8046b1211cd20"
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
