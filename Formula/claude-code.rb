# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.64.tgz"
  sha256 "1bc087f3e30d1b9cd2dc6a367d16e8b8f1ab48d0ae7bf693ef7d1748d5da4029"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.64"
    sha256 cellar: :any,                 arm64_sonoma: "d508db0f140fc7be98707ae05611285e30f9bfcb75aabd2dd492cc16b2fa92ef"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "13e82ddb31f7477fafd47fbc279d118107aaf0e4f9f259976f6c4cdba4c9147f"
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
