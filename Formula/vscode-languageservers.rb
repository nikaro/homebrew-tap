require "language/node"

class VscodeLanguageservers < Formula
  desc "HTML/CSS/JSON/ESLint language servers extracted from vscode"
  homepage "https://www.npmjs.com/package/vscode-langservers-extracted"
  url "https://registry.npmjs.org/vscode-langservers-extracted/-/vscode-langservers-extracted-4.7.0.tgz"
  sha256 "879a28e431f65d3b529d566b47ac8b469581f4c379b28ec3d9da026fe517c722"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
