require "language/node"

class VimLanguageServer < Formula
  desc "VImScript language server, LSP for vim script"
  homepage "https://github.com/iamcco/vim-language-server"
  url "https://registry.npmjs.org/vim-language-server/-/vim-language-server-2.3.1.tgz"
  sha256 "ffe0d18258a4b09bec46ec853f8838748c007c62c1fcf12d1eefedfaf19e1c46"
  license "MIT"
  head "https://github.com/iamcco/vim-language-server.git", branch: "master"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
