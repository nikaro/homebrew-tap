# rev1

require "language/node"

class Devcontainer < Formula
  desc "Create and configure a dev container from devcontainer.json"
  homepage "https://containers.dev/"
  url "https://registry.npmjs.org/@devcontainers/cli/-/cli-0.26.1.tgz"
  sha256 "b0b6b3a276c10c1f149b16a3ae312ea11e8addaff5fe45680323355506295078"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/devcontainer-0.26.1"
    rebuild 1
    sha256                               ventura:      "3f1622afd9055f1b64f76642976b64c7fae45d595ff199a24ddd8ed7ce8110d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "646c9aec208c01d924ed1cd103deabc74f1f092b77eb95b95537ea4ce03efddb"
  end

  depends_on "python" => :build
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
