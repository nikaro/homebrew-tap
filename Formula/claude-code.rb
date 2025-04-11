# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.68.tgz"
  sha256 "965fc80d08a129ca634e7a723868001d93f37c87780b650fb6de0f86e6636e59"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.67"
    sha256 cellar: :any,                 arm64_sonoma: "bef36e3c03558a96433546cad104d440f5add9990cfcd756f633d689ee6f4eb4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "58077114b3beac483913eb5611794d239a797bb5e39cee9393a795b9878ff7b6"
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
