# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.con/nikaro/zabbixmon"
  version "0.5.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.5.0/zabbixmon_0.5.0_darwin_amd64.tar.gz"
      sha256 "80543f34afd8cdaa54bc0e97d3ba7771b8630b1c72f2b66f103f4c1a1a0c87dc"

      def install
        bin.install "zabbixmon"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.5.0/zabbixmon_0.5.0_darwin_arm64.tar.gz"
      sha256 "971d01954ea2f6f51ea00d507a44ee0ac65542a36393dc9da5c1154cb61c604d"

      def install
        bin.install "zabbixmon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.5.0/zabbixmon_0.5.0_linux_amd64.tar.gz"
      sha256 "46b323d2dd1e7721d508c7e744d9ab084d48c6011944a3657f20d33d1050f5fa"

      def install
        bin.install "zabbixmon"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.5.0/zabbixmon_0.5.0_linux_arm64.tar.gz"
      sha256 "e52b64a0d98b1b152ea9384486f3f19bac5c41bcd18c1adbb3f152273927eccb"

      def install
        bin.install "zabbixmon"
      end
    end
  end

  test do
    system "#{bin}/zabbixmon", "--help"
  end
end
