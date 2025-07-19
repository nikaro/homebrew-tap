# typed: false

class Tombi < Formula
  desc "TOML Formatter / Linter / Language Server"
  homepage "https://github.com/tombi-toml/tombi"
  url "https://github.com/tombi-toml/tombi/archive/refs/tags/v0.4.34.tar.gz"
  sha256 "29b8a493d1f8266468b44780457fbd7c659df7fbd6cc544aba6701a19f2b3e85"
  license "MIT"
  head "https://github.com/tombi-toml/tombi.git", branch: "main"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/tombi-0.4.34"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e992d517d93599cff5bf2c668366e7f396bd3c8f942d64c02dd239e3e4a68dc1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7126d5db84b58ef9480cb1f90464e3f18412bebc3b85b1f020fbd0a5d0c1aba6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "rust/tombi-cli")
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
    pipe_output("#{bin}/tombi lsp", input)
  end
end
