# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.79.tgz"
  sha256 "162f6f405acb3ee5d92e847392ba6d55719859e61bb596978851acdac6351bde"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.79"
    sha256 cellar: :any,                 arm64_sonoma: "ebd7cfd8e9128d2a7b0fd0c75686c4f8542f769d3c471c06256c9e8e9f52007d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b74a718f5937f2ecbd03acefc116595ca710a55b0524834b16998d603a9b5dd6"
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
