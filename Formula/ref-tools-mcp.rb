# typed: false

require "language/node"

class RefToolsMcp < Formula
  desc "MCP server to access documentations"
  homepage "https://github.com/ref-tools/ref-tools-mcp"
  url "https://registry.npmjs.org/ref-tools-mcp/-/ref-tools-mcp-0.16.0.tgz"
  sha256 "8352bcefae40baea3f6fd2b181ae139c7016585cbd68996e2ebcb1a416a97f77"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/ref-tools-mcp-0.16.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8a086e5e6f45062399468e0af7192d725a91082f27fa5f61de3c78261c5eb456"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "edf814d5382974f0ebd0ed976dec0af918ed5196bf1a6482a3e3cc9dd42a97dd"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  # test do
  #   assert_match "#{version} (Claude Code)", shell_output("#{bin}/claude --version")
  # end
end
