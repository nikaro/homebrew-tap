# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.64.tgz"
  sha256 "1bc087f3e30d1b9cd2dc6a367d16e8b8f1ab48d0ae7bf693ef7d1748d5da4029"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.62"
    sha256 cellar: :any,                 arm64_sonoma: "14b8739edecfd0dcdf3a12c103c50a43f9dc22534b1139a3b3a5c6ad329321d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "113d554139d31a054fd783d121f2612c6cc4b9e5e3c95b1d441b4aef482b310e"
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
