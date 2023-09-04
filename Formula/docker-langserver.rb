# rev1

require "language/node"

class DockerLangserver < Formula
  desc "This is a language server for Dockerfiles"
  homepage "https://github.com/rcjsuen/dockerfile-language-server-nodejs"
  url "https://registry.npmjs.org/dockerfile-language-server-nodejs/-/dockerfile-language-server-nodejs-0.10.2.tgz"
  sha256 "1509a3d44e795449bdf482c32da720a86de9d7d5ae9b2513209ce4503ede35e0"
  license "MIT"

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
