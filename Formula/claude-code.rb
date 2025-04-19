# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.74.tgz"
  sha256 "7cfcc74f58b46b832d17747e4c73c227f371fe95f80b40ef9902dcd281de509a"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.74"
    sha256 cellar: :any,                 arm64_sonoma: "ba19d656c0447a8195b5dc93d4f42f92054b4eb0b5249f87a2195f69217f4b64"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "102f672161dede31f0200d08b9453d589cc85cca96c53834214bb2ef011ac2dc"
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
