# typed: false

require "language/node"

class Codex < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"
  url "https://registry.npmjs.org/@openai/codex/-/codex-0.1.2504221401.tgz"
  sha256 "f04d7581518e8e0665c0ef18c556b37bd1edd40d5100b25397dc0d4493e23571"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/codex-0.1.2504221401"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "60f175f30dc225f92947d840bb0b56004ed8832a502aed1d9dcefa5de9c949bc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8ec0f7a5ed5cf9846fe1173c7381680750fa7914507a6959d52fea2742339e56"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codex --version")
  end
end
