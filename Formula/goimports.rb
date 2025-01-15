# typed: false

class Goimports < Formula
  desc "Go formatter that additionally inserts import statements"
  homepage "https://pkg.go.dev/golang.org/x/tools/cmd/goimports"
  url "https://github.com/golang/tools/archive/refs/tags/v0.29.0.tar.gz"
  sha256 "ec4af632779a82a8ff4933895f3658a052319865fda5641f2fd96f06fd2e69d3"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goimports-0.27.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9de95a5b270d493c8b6ce77f74b88b5c0df393d08805e0956f4652f059f343f9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "748c449d76df8e87298d964ae92dd474e7215bdabd823bbf0c202aee06c56b1f"
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
