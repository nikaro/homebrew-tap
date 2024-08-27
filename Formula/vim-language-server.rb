# typed: false

require "language/node"

class VimLanguageServer < Formula
  desc "VImScript language server, LSP for vim script"
  homepage "https://github.com/iamcco/vim-language-server"
  url "https://github.com/iamcco/vim-language-server/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "7061f913f2103c396a5c3a8ab5109767add6c39719e41f15227d77f44f485a85"
  license "MIT"
  revision 3

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/vim-language-server-2.3.1_3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "76adf8d66108bbd1e6db5d0e138b557e5e9ba9ffce0b1fdd181d11321e82e9bb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ad30c40a5264c2a9777e2822b16339b4f01861204a4adb6899fcebf433c29f0a"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
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
