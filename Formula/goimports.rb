class Goimports < Formula
  desc "Go formatter that additionally inserts import statements"
  homepage "https://pkg.go.dev/golang.org/x/tools/cmd/goimports"
  url "https://github.com/golang/tools/archive/refs/tags/v0.24.0.tar.gz"
  sha256 "7ebfbdf31af28c4fd3a6cf1dec7bbfdd83e5292ae1ba5eb8825f8d90221a66fc"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    chdir "cmd/goimports" do
      system "go", "build", *std_go_args
    end
  end
end
