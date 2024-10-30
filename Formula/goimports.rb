# typed: false

class Goimports < Formula
  desc "Go formatter that additionally inserts import statements"
  homepage "https://pkg.go.dev/golang.org/x/tools/cmd/goimports"
  url "https://github.com/golang/tools/archive/refs/tags/v0.26.0.tar.gz"
  sha256 "0e43828dec94d04dfb7fe8b06de65dd6c7552b2b81686b0f5bfabc947f52268e"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goimports-0.25.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7220924fd5a52366d80487860805b591d456922a9664f2148ed07a53e34b2586"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "229840a1dc7a183dc2f22fb664d9da05ae784dc23972b47727faa064460bb536"
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
