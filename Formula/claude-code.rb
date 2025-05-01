# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.94.tgz"
  sha256 "c848859fa41cbdc8f25b457bb771958eb5f34528e3e85214d21f472ffd9b47aa"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.90"
    sha256 cellar: :any,                 arm64_sonoma: "96c49414962f372df2f91928879d4ea62acbb1f32e7ae96f7ad3fa9169b6590e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7e7cf03499be3faa0a1aa97dcedac47be92ce54efdf652bba33db290d656a2c8"
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
