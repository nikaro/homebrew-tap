# typed: false

class Tombi < Formula
  desc "TOML Formatter / Linter / Language Server"
  homepage "https://github.com/tombi-toml/tombi"
  url "https://github.com/tombi-toml/tombi/archive/refs/tags/v0.4.37.tar.gz"
  sha256 "224b7a9f9051461dc8791a178f0d32ab8774bfb2015e362e7c3f22fcb02851a4"
  license "MIT"
  head "https://github.com/tombi-toml/tombi.git", branch: "main"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/tombi-0.4.35"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "35bfdb24020e6a7f201012c2def051429312b2e35aaee1d1fe4d1babd5f83795"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "776b06164b270d4fdbdf5fb8801d50629709cfdbd09772d54c743b87fed594d4"
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
