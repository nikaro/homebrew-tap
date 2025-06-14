# typed: false

require "language/node"

class Context7Mcp < Formula
  desc "Up-to-date code documentation for LLMs and AI code editors"
  homepage "https://github.com/upstash/context7"
  url "https://registry.npmjs.org/@upstash/context7-mcp/-/context7-mcp-1.0.14.tgz"
  sha256 "bb101a72e38224e176c93cdb3956f4ae396df02ff0bac7b6c68f444224fb08b0"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/context7-mcp-1.0.14"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0faeb17bca2a2fce8991a23c578520012a2c115e07cb9eb20a0ea5b71b270b83"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d7854941ed43fcfd15e7019d20d009d3a3312d7859292387cbc5965493caed14"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end
end
