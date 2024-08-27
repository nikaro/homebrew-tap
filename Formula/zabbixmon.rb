# typed: false

class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  url "https://github.com/nikaro/zabbixmon/archive/refs/tags/0.9.11.tar.gz"
  sha256 "2789990b753f93ff571d2108e8962d5df3905f9c33a313564b5ae5639fc1c48f"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/zabbixmon-0.9.11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "78f8e04239475952d4ceb81f2a7888b27398b7a2a07105e12e1c22c6fb65532a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9fb9ad3233d9bf52af60ef954cc478d3dcb458f23b83016678ede115f02e4087"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
