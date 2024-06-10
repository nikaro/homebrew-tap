class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  url "https://github.com/nikaro/zabbixmon/archive/refs/tags/0.9.7.tar.gz"
  sha256 "970c817a99961877cc0f9654653b4200479b4c64bf3e4760bce40db08bd81c8d"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/zabbixmon-0.9.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e003afed13c9dd17ee840aabf9a7817a4a21f5d699cb8e89267198f8c92a39fa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7250684eee1ee1904f5025682b3d6a7a964696145a7b5b5709791ce046c9abd0"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
