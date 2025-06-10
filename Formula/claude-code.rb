# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-1.0.18.tgz"
  sha256 "6d8fa5901786606cb7c4b728a3a1e57f9db6df3d6b696b9ab51d153103dfc4a7"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-1.0.17"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a6c407b77eab5c7b68ae61c62df5a0d09726952a3b75e4f4ee700c5f92a7ae39"
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
