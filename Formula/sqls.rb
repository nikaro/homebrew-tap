class Sqls < Formula
  desc "SQL language server written in Go"
  homepage "https://github.com/sqls-server/sqls"
  url "https://github.com/sqls-server/sqls/archive/refs/tags/v0.2.28.tar.gz"
  sha256 "18dd9a4c35137ed01926638a1fa8b0f54f1dd00af0e8e54e18a257ddd62eae45"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/sqls-0.2.27"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6b3aa8781bc80f031f5e8ea65c330b39c6a9db04ccf7600edff12a96163a07a4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2bda08d9011ab6b0fc2fae44ee0520149f4d5d221c6c559d7a6ad2a276f3dea1"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
