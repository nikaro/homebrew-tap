# typed: false

require "language/node"

class Context7Mcp < Formula
  desc "Up-to-date code documentation for LLMs and AI code editors"
  homepage "https://github.com/upstash/context7"
  url "https://registry.npmjs.org/@upstash/context7-mcp/-/context7-mcp-1.0.13.tgz"
  sha256 "22e1ed19552cc8b7d8f7d9d37b46b55facee05d921b93300417a4ad669c89b24"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/context7-mcp-1.0.13"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e13ef1a662a97cf7fd89f020be3a0e8e99c54dfd94a9bcbb1af365e5e661cbc7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1978a30838436b3e9de6ff9eb1c8d39c7856d5a589ae737553fcecbd339ce1fa"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end
end
