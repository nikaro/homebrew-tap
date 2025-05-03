# typed: false

require "language/node"

class Codex < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"
  url "https://registry.npmjs.org/@openai/codex/-/codex-0.1.2505021246.tgz"
  sha256 "70d27f89af3eb9d2697de0a9ba68564d32fc6faecb6f8dfcd2cca7e6ab919ab8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/codex-0.1.2505021246"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7704ca915a19f5f44caeed9356c07c900bf455a9dca9f1290b8827183d1784a6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2ce21fa63a4b555c55a2d8a3338feb14db2e069bd29f21f8d818dba0354c5bba"
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
