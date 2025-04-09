# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.66.tgz"
  sha256 "57a15058b46f9e75424a7d19859a96b7e836e7a93f14e45a5914d3c8d63300cc"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.65"
    sha256 cellar: :any,                 arm64_sonoma: "e90e6cf5ceb84410bc24bea87e7cc5eff675d3e903cef96604f67fd69aef8820"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "89929502e0060305f1e6bf5c1795996957421073dc73986ada28b0f9973873b8"
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
