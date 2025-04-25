# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.81.tgz"
  sha256 "898e14517bc09024e00d1c17409956523325ee66897a08a04d141f60219a7b3a"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.81"
    sha256 cellar: :any,                 arm64_sonoma: "e6879fd61c050173fc56bcf1c1b09363862df6e4ad7b6cf721b117a67655e9c4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5eaf10f5457cf3de54a80cb19f9a83147903eed2a6354dde5828552eb8c1fe8d"
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
