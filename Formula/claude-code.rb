# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.69.tgz"
  sha256 "6d08ca85367322da2b31752caa93e0ac71c10664ed1c8a5cbff6cd254ea4a020"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.68"
    sha256 cellar: :any,                 arm64_sonoma: "b7e25c843b53af0dfa8841115e8e3b31d90b7582c7f8426d5173cf94510d744d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9464aad840f8c5661a9cee49e39936a539b2010ecaf8a81b9bef1b296b2af657"
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
