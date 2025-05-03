# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.100.tgz"
  sha256 "702fbbe06278f023dc08bdf7a64911af1a4ac5a4e0f75e496b055e5c6f436839"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.99"
    sha256 cellar: :any,                 arm64_sonoma: "34b4b8b32a5eea4a1bfa9e951a77be6d1b891ecc24f339a1a3fc72827e351fde"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c4310916a160c71f1fa084d4df2d273ab6bb3e7aff27f16b58730fdab4fb058d"
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
