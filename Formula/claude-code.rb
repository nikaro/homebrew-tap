# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-1.0.5.tgz"
  sha256 "0cc4f1d42de13df44de52e6a61d23b6553b5a8938f473a249702a224d39bccbe"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-1.0.5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "14ae1d902eb2d4caa4672632bec6e0caba4bfacf75b9a3775a1c113dceb8ef06"
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
