class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  url "https://github.com/nikaro/zabbixmon/archive/refs/tags/0.9.5.tar.gz"
  sha256 "b86001419d7c6549af3163ae8a9db7373f42767391a9cc58b426b61174cd67df"
  license "GPL-3.0-or-later"
  revision 1

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/zabbixmon-0.9.3_1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "445a152fe99145c7c74add9bf0c86a04585eeedba441e9eec0958a20f69ce1db"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f43767d1a62b32ac621bcaa86a3907bf160dd3aac32227545b001dcb6f50852"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
