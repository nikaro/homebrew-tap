class McpServerKubernetes < Formula
  desc "MCP Server for kubernetes management commands"
  homepage "https://github.com/Flux159/mcp-server-kubernetes"
  url "https://registry.npmjs.org/mcp-server-kubernetes/-/mcp-server-kubernetes-2.3.1.tgz"
  sha256 "04859513e59e7ed3d96f69620c69b7f6125aea11cd09d3d172a182d67e5abd91"
  license "MIT"

  depends_on "gcc" => :build
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
