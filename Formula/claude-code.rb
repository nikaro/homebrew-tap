# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.70.tgz"
  sha256 "6a47d9af81e05939fa54832a9eef6d4f9278beff51a7330f4e27aa9efc498ed1"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.70"
    sha256 cellar: :any,                 arm64_sonoma: "be0f047655f441610af26b5e88a22b38b6a519dcdb3393c91684c975123497c1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "daf0e529d1552a384622d8c5859d1bb8dc774c01576e696d3ed088c88898e2f0"
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
