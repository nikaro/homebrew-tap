require "language/node"

class DockerfileLanguageServerNodejs < Formula
  desc "This is a language server for Dockerfiles"
  homepage "https://www.npmjs.com/package/dockerfile-language-server-nodejs"
  url "https://registry.npmjs.org/dockerfile-language-server-nodejs/-/dockerfile-language-server-nodejs-0.10.2.tgz"
  sha256 "1509a3d44e795449bdf482c32da720a86de9d7d5ae9b2513209ce4503ede35e0"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
