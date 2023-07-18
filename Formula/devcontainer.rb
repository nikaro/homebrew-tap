require "language/node"

class Devcontainer < Formula
  desc "Create and configure a dev container from devcontainer.json"
  homepage "https://containers.dev/"
  url "https://registry.npmjs.org/@devcontainers/cli/-/cli-0.26.1.tgz"
  license "MIT"
  sha256 "b0b6b3a276c10c1f149b16a3ae312ea11e8addaff5fe45680323355506295078"

  depends_on "python" => :build
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
