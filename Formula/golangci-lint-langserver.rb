class GolangciLintLangserver < Formula
  desc "Golangci-lint language server"
  homepage "https://github.com/nametake/golangci-lint-langserver"
  url "https://github.com/nametake/golangci-lint-langserver/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "ad7241d271b9b46b6fc784ab1d035c322bd6ae44938514d69f5ad516a1a9fbfd"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
