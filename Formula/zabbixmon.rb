class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  url "https://github.com/nikaro/zabbixmon/archive/refs/tags/0.9.3.tar.gz"
  sha256 "71e2e814534ffa0130d1bff6fe5ecca33101f6616fdd1a7448af859b025cbb65"
  license "GPL-3.0-or-later"
  revision 1

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
