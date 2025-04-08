# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.65.tgz"
  sha256 "22453082dd729a99afc22bf25230313d01d5867bed3a8837e1aadc340fc68a73"
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
