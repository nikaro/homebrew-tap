# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.59.tgz"
  sha256 "211562785eae3087e757754a1494d37d8683fcbb0af207a7083fc68585894af9"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.56"
    sha256 cellar: :any,                 arm64_sonoma: "08f3b4bdb9108f003cdfbf78390ba36a90c0c481d0b6beb50671a2489537f7de"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "220c4eaa87eab8b2d6b1592b85e20af149c9adf95f4bdefda455e70c397b2913"
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
