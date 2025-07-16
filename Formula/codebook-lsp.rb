# typed: false

class CodebookLsp < Formula
  desc "Spell Checker for Code"
  homepage "https://github.com/blopker/codebook"
  url "https://github.com/blopker/codebook/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "a8500cf8e8484f16a9b469c145ab73547e59d69a64120e921e8e5a02d80e7ad0"
  license "MIT"
  head "https://github.com/blopker/codebook.git", branch: "main"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/codebook-lsp-0.3.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "fa86455a315dd03a9f83a0c2c1cffeb833d4992152e3865b2cd587adb4bb4bfc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "52f97d33b492695ec240ccc1fc75472875dc86a5088bacea5a08398097f2d79f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/codebook-lsp")
  end

  test do
    assert_match "codebook-lsp #{version}", shell_output("#{bin}/codebook-lsp --version")
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
    pipe_output("#{bin}/codebook-lsp server", input)
  end
end
