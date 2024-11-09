# typed: false

class Goimports < Formula
  desc "Go formatter that additionally inserts import statements"
  homepage "https://pkg.go.dev/golang.org/x/tools/cmd/goimports"
  url "https://github.com/golang/tools/archive/refs/tags/v0.27.0.tar.gz"
  sha256 "7e187e6ab17b0b9df1870ce52e27e335bcaf3d5e1e3a7df1d0e047816ccf6d82"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goimports-0.26.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b8e6e7267f65d11c66eb3c0366988f9aab9305b90f6b5e3b63420ef6899b8a99"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "888db5dc8c6b979c05f2c1f692e22ac624e446e02f91900b39dd5b9198cc0ed1"
  end

  depends_on "go"

  def install
    chdir "cmd/goimports" do
      system "go", "build", *std_go_args
    end
  end

  test do
    (testpath/"main.go").write <<~EOS
      package main

      func main() {
        fmt.Println("hello")
      }
    EOS

    assert_match(/\+import "fmt"/, shell_output("#{bin}/goimports -d #{testpath}/main.go"))
  end
end
