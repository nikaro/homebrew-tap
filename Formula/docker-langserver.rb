# rev1

require "language/node"

class DockerLangserver < Formula
  desc "This is a language server for Dockerfiles"
  homepage "https://github.com/rcjsuen/dockerfile-language-server-nodejs"
  url "https://registry.npmjs.org/dockerfile-language-server-nodejs/-/dockerfile-language-server-nodejs-0.11.0.tgz"
  sha256 "042cbd1fb9baf818bf5eb0730a45a0ae257d42e74d358c8bf177f5a561f3839b"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/docker-langserver-0.11.0"
    sha256 cellar: :any_skip_relocation, ventura:      "5cafc831874eb4524b8a4e9e4b96f6ed411bf526916f8843b537326e3f8298c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c39c4c8322f9cfbee1f078b6eb8c65fcf43e2aef3e9a1347d5f9a52124abc0be"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    require "open3"

    dockerfile = <<~DOCKERFILE
      FROM debian:latest
      RUN apt-get update
    DOCKERFILE

    Open3.popen3("#{bin}/docker-langserver", "--stdio") do |stdin, _stdout|
      stdin.write dockerfile.to_s
    end
  end
end
