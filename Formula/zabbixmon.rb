class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  url "https://github.com/nikaro/zabbixmon/archive/refs/tags/0.9.9.tar.gz"
  sha256 "251dd2d2e121d55e0d2dde6a37b241f79226223c8fcc8e7e64873d2f3ab000e9"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/zabbixmon-0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a9ff4cd2a31046dded4cddac49b6e2ac78e36e9185985540fc24758bc9e2d50a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8a29362534dfdd6c4e4c326cce9f2245389369c9fb86e9dbd2f828b40714256c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
