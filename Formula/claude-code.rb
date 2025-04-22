# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.76.tgz"
  sha256 "c5be09a274eb663ed92cdbcf44828a1373c67b182f9a7947d2300b4ac1deb8de"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.76"
    sha256 cellar: :any,                 arm64_sonoma: "b7f16c7424478c8c1e1e4cadb7d177935d733b568f7759b2e0fdaef97d1cb62f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cfaf853f0863a7c2c2e58b78d5466e4b3de2b862ad75b47c8f7e5e8c7b97fec3"
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
