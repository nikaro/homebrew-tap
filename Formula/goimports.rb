# typed: false

class Goimports < Formula
  desc "Go formatter that additionally inserts import statements"
  homepage "https://pkg.go.dev/golang.org/x/tools/cmd/goimports"
  url "https://github.com/golang/tools/archive/refs/tags/v0.30.0.tar.gz"
  sha256 "c1e93ac3be804264bbe3779418caa6728944472cf5bc9368365657e31c1b4a2e"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goimports-0.30.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dd7709abb6d24f0b9ecc6799afdd11e83ef67a6f57cb9e5062728ccb497c07f7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c53ce547dd8200a1f3a55901000aba85ba0d31e06d53cec56e97e7a28a65df51"
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
