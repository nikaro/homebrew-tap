require "language/node"

class VscodeLanguageservers < Formula
  desc "HTML/CSS/JSON/ESLint language servers extracted from vscode."
  homepage "https://www.npmjs.com/package/vscode-langservers-extracted"
  license "MIT"
  url "https://registry.npmjs.org/vscode-langservers-extracted/-/vscode-langservers-extracted-4.6.0.tgz"
  sha256 "d94b4dc5c4095ccfbb140119aa2dafdb4c7fdf4204c69ef08e56633b068346e6"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
