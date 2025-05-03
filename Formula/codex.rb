# typed: false

require "language/node"

class Codex < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"
  url "https://registry.npmjs.org/@openai/codex/-/codex-0.1.2505021246.tgz"
  sha256 "70d27f89af3eb9d2697de0a9ba68564d32fc6faecb6f8dfcd2cca7e6ab919ab8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/codex-0.1.2504301751"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e434e61b8eefad6abf48fa0c2aadaa7ead7bab93feabfd9b2af5b3dd22a00ed1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9e38cd1efcf028ca89e9db842ed1082e041a7e6025ae71aa9dd2e00010dec897"
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
