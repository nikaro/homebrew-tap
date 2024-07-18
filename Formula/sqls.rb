class Sqls < Formula
  desc "SQL language server written in Go"
  homepage "https://github.com/sqls-server/sqls"
  url "https://github.com/sqls-server/sqls/archive/refs/tags/v0.2.27.tar.gz"
  sha256 "f47aff522ce20eb4f87fb099d492c35503824b10d40cb3d4b755bc0a8d6ddf56"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
