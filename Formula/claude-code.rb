# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.78.tgz"
  sha256 "2d5f36e0bdf0aa6eb94b12ae7ac36795861fa2fe29c00c4539f9431b3739f6fc"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.78"
    sha256 cellar: :any,                 arm64_sonoma: "5a3ce3f0ebed7cbf18fe04e530337feb9455e366d85e70436be4655433dee599"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "da160f6583dfc24abdef3359e09a978b212a6db12a1e2a9a383eeff133b2b7b2"
  end

  depends_on "node"
  depends_on "pcre2"
  depends_on "ripgrep"
  depends_on "gh" => :optional
  depends_on "glab" => :optional

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "#{version} (Claude Code)", shell_output("#{bin}/claude --version")
  end
end
