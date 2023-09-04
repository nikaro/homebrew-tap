# rev1

require "language/node"

class DockerLangserver < Formula
  desc "This is a language server for Dockerfiles"
  homepage "https://github.com/rcjsuen/dockerfile-language-server-nodejs"
  url "https://registry.npmjs.org/dockerfile-language-server-nodejs/-/dockerfile-language-server-nodejs-0.10.2.tgz"
  sha256 "1509a3d44e795449bdf482c32da720a86de9d7d5ae9b2513209ce4503ede35e0"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/docker-langserver-0.10.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:      "e4da86ab720ba7e682dd4b3bf1ccd270df0ce2487e4222a2a83120b743100fd5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "27114a04c67cda325dbb6874a646439a0eef8f796d23788fabe68d880ec4aca9"
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
