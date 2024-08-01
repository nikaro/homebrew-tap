require "language/node"

class Basedpyright < Formula
  desc "Pyright fork with various improvements and built-in pylance features"
  homepage "https://github.com/DetachHead/basedpyright"
  url "https://github.com/DetachHead/basedpyright/archive/refs/tags/v1.15.1.tar.gz"
  sha256 "51fb7cfc0ad1eae6073c4b6360466f7f696b8b25b5779aee20589a4e01d3dd22"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/basedpyright-1.15.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4c89a246d46f47cbda0ead165c15ab074c729d997d34885476f2132fc7316878"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "161b32f442fb5c50e63b39f8753fb4e1c76258f96dfe25e178f8cdbf2bb34f93"
  end

  depends_on "node"

  def install
    chdir "packages/pyright" do
      system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    end
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
