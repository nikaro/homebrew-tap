# typed: false

class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  url "https://github.com/nikaro/zabbixmon/archive/refs/tags/0.9.22.tar.gz"
  sha256 "09dd13544ce274f834e10d93e323bae13d6d0d3417c3e3c9cadd3f313196d14a"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/zabbixmon-0.9.22"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "41a77f1b05a4a14e194c18485af6c0a454fce5b06aab2f3a8284120256ba003b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa35f714b26051956468d533222dd40849c41c0d02b480e97432cd74afc531d3"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
