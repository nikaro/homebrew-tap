# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.con/nikaro/zabbixmon"
  version "0.6.2"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.6.2/zabbixmon_0.6.2_darwin_arm64.tar.gz"
      sha256 "8de9c20737fe7c2245ec4c550dd06f78e65a300192d11bed59784aedc638d557"

      def install
        bin.install "zabbixmon"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.6.2/zabbixmon_0.6.2_darwin_amd64.tar.gz"
      sha256 "7854047c52d3821ba5e0f8499f4d16f5958a71cfe6a32657d4f2e7b624cae961"

      def install
        bin.install "zabbixmon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.6.2/zabbixmon_0.6.2_linux_amd64.tar.gz"
      sha256 "48869acdd961250ebec7f8ba899a1dab3c06aefa044a08501d24d0b48b888bb1"

      def install
        bin.install "zabbixmon"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.6.2/zabbixmon_0.6.2_linux_arm64.tar.gz"
      sha256 "9bbdfc609388f2274b04d99fc563f4f884f94c960b35a90bc76fb2a3fda9a798"

      def install
        bin.install "zabbixmon"
      end
    end
  end

  test do
    system "#{bin}/zabbixmon", "--help"
  end
end
