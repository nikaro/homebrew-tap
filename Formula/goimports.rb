# typed: false

class Goimports < Formula
  desc "Go formatter that additionally inserts import statements"
  homepage "https://pkg.go.dev/golang.org/x/tools/cmd/goimports"
  url "https://github.com/golang/tools/archive/refs/tags/v0.30.0.tar.gz"
  sha256 "c1e93ac3be804264bbe3779418caa6728944472cf5bc9368365657e31c1b4a2e"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goimports-0.29.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "00daad2caf3c07d23e18121426d930be01e3129eb911d4094b27e9f13dff4a36"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ed7d6e51ecc7f95d04875b9b098c651c5c73337217d04db3b89ddd2f94a873b0"
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
