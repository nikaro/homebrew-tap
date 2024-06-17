class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  url "https://github.com/nikaro/zabbixmon/archive/refs/tags/0.9.8.tar.gz"
  sha256 "0a738690cff7b21f9d69bdfd00d8f0223ef623967f722fd5799220e994f83b02"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/zabbixmon-0.9.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3eca77fd3d4cadc62b85bc039754e59cd54ed8064c1e9ce3a63873106c0ec080"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "eb399d466cf3f4afd66ebfb53a3e1fde81429d34aab029acfa0bf1ab5db1f5b3"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
