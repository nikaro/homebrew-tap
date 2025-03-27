# typed: false

class LspAi < Formula
  desc "Language server that serves as a backend for AI-powered functionality"
  homepage "https://github.com/SilasMarvin/lsp-ai"
  url "https://github.com/SilasMarvin/lsp-ai/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "2868ee06207659d7b9f25d173e41abfd9e1a05f1e1547542b4b6c6daae4304b9"
  license "MIT"
  head "https://github.com/SilasMarvin/lsp-ai.git", branch: "main"

  depends_on "rust" => :build
  depends_on "llama.cpp"

  def install
    gpu = on_arch_conditional arm: "metal", intel: "cuda"
    system "cargo", "install",
      "--features", "llama_cpp",
      "--features", gpu,
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
