require "language/node"

class Basedpyright < Formula
  desc "Pyright fork with various improvements and built-in pylance features"
  homepage "https://github.com/DetachHead/basedpyright"
  url "https://github.com/DetachHead/basedpyright/archive/refs/tags/v1.15.1.tar.gz"
  sha256 "51fb7cfc0ad1eae6073c4b6360466f7f696b8b25b5779aee20589a4e01d3dd22"
  license "MIT"

  depends_on "node"

  def install
    chdir "packages/pyright" do
      system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    end
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
