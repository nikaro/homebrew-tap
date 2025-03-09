# typed: false

class Goimports < Formula
  desc "Go formatter that additionally inserts import statements"
  homepage "https://pkg.go.dev/golang.org/x/tools/cmd/goimports"
  url "https://github.com/golang/tools/archive/refs/tags/v0.31.0.tar.gz"
  sha256 "e5d74f1e63a1ee669e75e76668cea1b110e2b9d19c67710f60939ee38070a5a7"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goimports-0.31.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7bb2141647aeb42f3374d38826e734631c07fee459e81bb502f24c60d27f6df6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c2d5d32cf226e6ca5a0d015ad582b8043354f16cb8b467559413a6539fa1d137"
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
