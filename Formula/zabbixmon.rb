# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zabbixmon < Formula
  desc "CLI application to show currents alerts on Zabbix"
  homepage "https://github.com/nikaro/zabbixmon"
  version "0.6.3"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.6.3/zabbixmon_0.6.3_darwin_arm64.tar.gz"
      sha256 "dcc15832420858e983bb76ac37c2a6c9e16098497f721fa73b83c6bd056ea663"

      def install
        bin.install "zabbixmon"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.6.3/zabbixmon_0.6.3_darwin_amd64.tar.gz"
      sha256 "da28ab5dcaa39053687d02b578c712bcef22f575932e3ad3f9f9fd41edff23d3"

      def install
        bin.install "zabbixmon"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.6.3/zabbixmon_0.6.3_linux_arm64.tar.gz"
      sha256 "b3ddf2a90f57bfdc0851f9b485a77dbb3cead7ec80b2b8af46e89c206760d182"

      def install
        bin.install "zabbixmon"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/zabbixmon/releases/download/v0.6.3/zabbixmon_0.6.3_linux_amd64.tar.gz"
      sha256 "3b5d0c5ca9ab4e8c01edbf81f4a2b644094f650449611b8aa64f94a7b48b2110"

      def install
        bin.install "zabbixmon"
      end
    end
  end

  test do
    system "#{bin}/zabbixmon", "--help"
  end
end
