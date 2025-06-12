# typed: false

require "language/node"

class RefToolsMcp < Formula
  desc "MCP server to access documentations"
  homepage "https://github.com/ref-tools/ref-tools-mcp"
  url "https://registry.npmjs.org/ref-tools-mcp/-/ref-tools-mcp-0.16.0.tgz"
  sha256 "8352bcefae40baea3f6fd2b181ae139c7016585cbd68996e2ebcb1a416a97f77"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  # test do
  #   assert_match "#{version} (Claude Code)", shell_output("#{bin}/claude --version")
  # end
end
