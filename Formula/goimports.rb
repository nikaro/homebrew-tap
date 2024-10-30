# typed: false

class Goimports < Formula
  desc "Go formatter that additionally inserts import statements"
  homepage "https://pkg.go.dev/golang.org/x/tools/cmd/goimports"
  url "https://github.com/golang/tools/archive/refs/tags/v0.26.0.tar.gz"
  sha256 "0e43828dec94d04dfb7fe8b06de65dd6c7552b2b81686b0f5bfabc947f52268e"
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
