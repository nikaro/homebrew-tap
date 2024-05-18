require "language/node"

class VimLanguageServer < Formula
  desc "VImScript language server, LSP for vim script"
  homepage "https://github.com/iamcco/vim-language-server"
  url "https://github.com/iamcco/vim-language-server/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "7061f913f2103c396a5c3a8ab5109767add6c39719e41f15227d77f44f485a85"
  license "MIT"
  revision 3

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/vim-language-server-2.3.1_2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e5979cd5c289a160372f605663ad66acdca833f9aedb804b1c1168e267a19b02"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0351a64956a690c4e7b46c495a0554014cd6148ab7ab8e0530ba98e6a7d78fd7"
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
