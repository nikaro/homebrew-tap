# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.90.tgz"
  sha256 "22df47ce7b22cb97ad85fa21de944ed0a68b9153b6d32ea2be2a741eda454480"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.86"
    sha256 cellar: :any,                 arm64_sonoma: "49b1abb33843d66842574b251382f89b7662fa6723bb453a3c4db58f90e86612"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "52b9efdbeee45ef5d3633973f8727e787727fedf37113f9d027562a107259895"
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
