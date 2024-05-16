require "language/node"

class VimLanguageServer < Formula
  desc "VImScript language server, LSP for vim script"
  homepage "https://github.com/iamcco/vim-language-server"
  url "https://registry.npmjs.org/vim-language-server/-/vim-language-server-3.2.5.tgz"
  sha256 "c8d3eae160a892e32837db3dcae515e843e5383fef52b8141940c8bcf8b6d59f"
  license "MIT"
  head "https://github.com/iamcco/vim-language-server", branch: "master"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
