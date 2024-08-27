# typed: false

class Sqls < Formula
  desc "SQL language server written in Go"
  homepage "https://github.com/sqls-server/sqls"
  url "https://github.com/sqls-server/sqls/archive/refs/tags/v0.2.28.tar.gz"
  sha256 "18dd9a4c35137ed01926638a1fa8b0f54f1dd00af0e8e54e18a257ddd62eae45"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/sqls-0.2.28"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "65df31ba1eed33059edde2c9690c9f48150e9b42e0bafd1ddd55d4de037c6f2f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "70c60349a1ec61bf2823cdd1a81699e8087c1bfc1ec9fa6f6516eb965439c959"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
