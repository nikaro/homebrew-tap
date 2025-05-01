# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.94.tgz"
  sha256 "c848859fa41cbdc8f25b457bb771958eb5f34528e3e85214d21f472ffd9b47aa"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.94"
    sha256 cellar: :any,                 arm64_sonoma: "765d3cc82f7cb329b6799c80a1f3fc1abd2b565826b566077ddffc1b113cd0dc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cef3e064be8dacc5cb15ef17c94140cb45b96c2014b6a2e049ba22e0345e0b29"
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
