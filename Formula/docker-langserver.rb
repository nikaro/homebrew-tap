require "language/node"

class DockerLangserver < Formula
  desc "Language server for Dockerfiles"
  homepage "https://github.com/rcjsuen/dockerfile-language-server"
  url "https://github.com/rcjsuen/dockerfile-language-server/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "8b471fe5bdbe2cc2f1eb9063b5817ee5500fea3e4bbb57d677a51634b6176c79"
  license "MIT"

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
    pipe_output("#{bin}/docker-langserver --stdio", input)
  end
end
