# typed: false

require "language/node"

class Codex < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"
  url "https://registry.npmjs.org/@openai/codex/-/codex-0.1.2504301751.tgz"
  sha256 "534efae4ced56e98b136a13bee4523acebf261267fecc11ea3df9a2854875186"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/codex-0.1.2504251709"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "61060677b9c0d401303018027de2b85e6914153a359d60eb5f3f324ce4c6666d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "40e383e9a12b741926bab2c46226354ae092c8bc18199e5c36c8664d9dfc1124"
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
