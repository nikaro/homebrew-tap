class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  url "https://github.com/nikaro/zabbixmon/archive/refs/tags/0.9.11.tar.gz"
  sha256 "2789990b753f93ff571d2108e8962d5df3905f9c33a313564b5ae5639fc1c48f"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/zabbixmon-0.9.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e159d9bb4487e06a0ba938e15723eba5e308edc78d27b7e2f18b261e569cac9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "204ad6c0bbc676ac77b8436cb386c6129aaaab9097adaa855236d08fee9b572a"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
