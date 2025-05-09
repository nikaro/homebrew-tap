# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.106.tgz"
  sha256 "41ca35e3928446b903a94a398bc5488ad0649fac601e760f134300d983dc8731"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.100"
    sha256 cellar: :any,                 arm64_sonoma: "9aea864d236f77d4e055d283c6d25790f293fba4946e787c8d6d6852832993f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "65eceb2eb8abbfdbf593a34bd9c5f1b113ca8b432e2df6cadd5e0338ae3f7b34"
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
