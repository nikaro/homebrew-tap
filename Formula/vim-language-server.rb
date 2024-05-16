require "language/node"

class VimLanguageServer < Formula
  desc "VImScript language server, LSP for vim script"
  homepage "https://github.com/iamcco/vim-language-server"
  url "https://registry.npmjs.org/vim-language-server/-/vim-language-server-2.3.1.tgz"
  sha256 "ffe0d18258a4b09bec46ec853f8838748c007c62c1fcf12d1eefedfaf19e1c46"
  license "MIT"
  head "https://github.com/iamcco/vim-language-server.git", branch: "master"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/vim-language-server-2.3.1"
    sha256 cellar: :any_skip_relocation, ventura:      "2816ecb968df9ce54e15371311f79f58500648479aa55d9991f1d984be56022e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8481b18cb9054d168a81913ce9c698946a65b3853e6bbe4208cb362e7442553b"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
