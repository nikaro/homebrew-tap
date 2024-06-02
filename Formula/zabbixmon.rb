class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  url "https://github.com/nikaro/zabbixmon/archive/refs/tags/0.9.6.tar.gz"
  sha256 "d60b2a7ad0704580764d3defb177a294b3f0a38f80cec5ea67c83ec29891c015"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/zabbixmon-0.9.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "182198eacd626c8e0bb1d890bc467a03876536077cd629586a17590569eb8962"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a3a1dd842a4771bd6d622a4a5f59d9fc28c9956459ef934e2c4a3c4fe4f9c4ca"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
