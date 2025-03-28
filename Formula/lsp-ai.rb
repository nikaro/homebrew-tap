# typed: false

class LspAi < Formula
  desc "Language server that serves as a backend for AI-powered functionality"
  homepage "https://github.com/SilasMarvin/lsp-ai"
  url "https://github.com/SilasMarvin/lsp-ai/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "2868ee06207659d7b9f25d173e41abfd9e1a05f1e1547542b4b6c6daae4304b9"
  license "MIT"
  head "https://github.com/SilasMarvin/lsp-ai.git", branch: "main"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/lsp-ai-0.7.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1842fe92fc9cd6ff38e9f4958766c819e67390b92ee7e0ff6d1ea038f4322836"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c778d0d6eb1e3e8657921737539a29bc6269a04968f1077800b2460f3bc71fb2"
  end

  depends_on "rust" => :build
  depends_on "llama.cpp"

  def install
    features = ["llama_cpp"]
    features << "metal" if OS.mac? && Hardware::CPU.arm?

    system "cargo", "install",
      "--features", features.join(","),
      *std_cargo_args(path: "crates/lsp-ai")
  end

  test do
    assert_match "lsp-ai #{version}", shell_output("#{bin}/lsp-ai --version")
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
    pipe_output("#{bin}/lsp-ai --stdio", input)
  end
end
