# typed: false

require "language/node"

class Codex < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"
  url "https://registry.npmjs.org/@openai/codex/-/codex-0.1.2504161551.tgz"
  sha256 "1036cd6ad6d6aa7490c8a8123704435af426efd48bebbe3f32539ac4b4c577a1"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/codex-0.1.2504161551"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b8f306af8370ed4d996c8de4a73f6b5b6d8846af74c26c3ee2f44fbc545d5a2c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "808072517c1814737435ca0456850e31526cbc74b6e13a2f52e473c97f6ec4ee"
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
