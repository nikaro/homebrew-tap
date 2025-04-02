# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.59.tgz"
  sha256 "211562785eae3087e757754a1494d37d8683fcbb0af207a7083fc68585894af9"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.59"
    sha256 cellar: :any,                 arm64_sonoma: "9e85e4c696fd33e25b2224890cbd7082431071151633fe885f4c9d91ddde6b88"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "17f598ba13c539201e694ec9f41a5a9ef0fbb7c81621631071450ba63e95b1de"
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
