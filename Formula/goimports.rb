# typed: false

class Goimports < Formula
  desc "Go formatter that additionally inserts import statements"
  homepage "https://pkg.go.dev/golang.org/x/tools/cmd/goimports"
  url "https://github.com/golang/tools/archive/refs/tags/v0.25.0.tar.gz"
  sha256 "c536188f5db744371f526f3059960945ed580b3ee60553a4f01956251ab36d20"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goimports-0.24.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bd1a6e8fbe77437f3fc806cd4a0e8dc42c8cd423dbb56c4f3482efd9457db9de"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "134e305c72335989625ecb42ca7100cf0494cab447f420c6358c8323fe65d3c0"
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
