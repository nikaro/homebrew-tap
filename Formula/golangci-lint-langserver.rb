# typed: false

class GolangciLintLangserver < Formula
  desc "Golangci-lint language server"
  homepage "https://github.com/nametake/golangci-lint-langserver"
  url "https://github.com/nametake/golangci-lint-langserver/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "ad7241d271b9b46b6fc784ab1d035c322bd6ae44938514d69f5ad516a1a9fbfd"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/golangci-lint-langserver-0.0.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "77dd2a2be3d11777c3d8067445a439eec878841a30b94ab44458b9563e7e7cdf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6c1330f7b3d4881d1d044d3114d9201ef57da05faf376a84c5d5b5afbf8ab80e"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
