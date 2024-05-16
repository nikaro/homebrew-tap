require "language/node"

class VimLanguageServer < Formula
  desc "VImScript language server, LSP for vim script"
  homepage "https://github.com/iamcco/vim-language-server"
  url "https://registry.npmjs.org/vim-language-server/-/vim-language-server-2.3.1.tgz"
  sha256 "ffe0d18258a4b09bec46ec853f8838748c007c62c1fcf12d1eefedfaf19e1c46"
  license "MIT"
  revision 2
  head "https://github.com/iamcco/vim-language-server.git", branch: "master"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/vim-language-server-2.3.1_1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "40cadc75c474ad716f6d7f87879ca3b0d1d85861e0f803386a7288f9428db763"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "38cd726fdadef3ec52f38392fa900c22371f17bd77217aa824f19fd3d2c34d60"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    json = <<~JSON
      {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "initialize",
        "params": {
          "rootUri": null,
          "capabilities": {}
        }
      }
    JSON
    input = "Content-Length: #{json.size}\r\n\r\n#{json}"
    pipe_output("#{bin}/vim-language-server --stdio", input)
  end
end
