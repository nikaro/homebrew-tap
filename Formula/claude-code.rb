# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.72.tgz"
  sha256 "3cdd622f118f5cd52b05f101e9d4492430082f8cb50212834c455812d78a42c4"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.72"
    sha256 cellar: :any,                 arm64_sonoma: "927ad4be9db3f6a0aac47ef0ddd1523e4f58b3f34b40944968c5f0adfb59728d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "147975b7784b9fd3b5531ba316b40fde71bb8f504cb96d6f2155744708e9656b"
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
