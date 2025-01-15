# typed: false

class GolangciLintLangserver < Formula
  desc "Golangci-lint language server"
  homepage "https://github.com/nametake/golangci-lint-langserver"
  url "https://github.com/nametake/golangci-lint-langserver/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "65c2ffa9b71da3fe7298d4b86ae5cd64108bdc8313026d9613f19956d5855abc"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/golangci-lint-langserver-0.0.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dcdbdf4e77702887d5c1776eb44a61db0d4c5d763013596e7af065be634f9d2c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "178b447399646a0fd23b2a04c90fc52bc22b86ded8351df3e9559db9be6bf126"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
