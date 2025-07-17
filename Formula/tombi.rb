# typed: false

class Tombi < Formula
  desc "TOML Formatter / Linter / Language Server"
  homepage "https://github.com/tombi-toml/tombi"
  url "https://github.com/tombi-toml/tombi/archive/refs/tags/v0.4.33.tar.gz"
  sha256 "e0bd28b09e0f572863fb82a266f86fa1e5485807977c54ac285eacdab35e5baf"
  license "MIT"
  head "https://github.com/tombi-toml/tombi.git", branch: "main"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/tombi-0.4.33"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a58d20a3cc65cf983c9b074ebbe2fdd117598609fc80cda6409dbde422b260e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aa3892ef5f92d507b3dad0b839d6ece09524517a1d5b11640dbb0714c657e931"
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
