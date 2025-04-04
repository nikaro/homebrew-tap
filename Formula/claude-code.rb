# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.62.tgz"
  sha256 "c065ef88d0cc01d6bdad44178a4635debfadcb9a1b9edf93ba7ec79430085232"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.61"
    sha256 cellar: :any,                 arm64_sonoma: "c92b7f204bd41c02fad29c98ae5bfd16b801f51f5524fc88a941c141a78a9cf3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e45ff18e13ec03e219587b58546be3246157888bb15c10c30b01296783c7816f"
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
