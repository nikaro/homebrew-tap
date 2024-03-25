class Talosctl < Formula
  desc "Talos Linux is a modern Linux distribution built for Kubernetes"
  homepage "https://github.com/siderolabs/talos"
  version "1.6.7"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.7/talosctl-darwin-arm64"
      sha256 "c3815d7d5f2b7f2571935f74aac5a51686b8c99a52173733b571ce242a81ba68"

      def install
        bin.install "talosctl-darwin-arm64" => "talosctl"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.7/talosctl-darwin-amd64"
      sha256 "4c9576552885313c9b39b6354b953824a657388f2ddc0a725e3290719477c3ee"

      def install
        bin.install "talosctl-darwin-amd64" => "talosctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.7/talosctl-linux-amd64"
      sha256 "99540b1d3bbc4d7bd41e8dfd5027941bed5eb29eff09756aed513b41e391eac9"

      def install
        bin.install "talosctl-linux-amd64" => "talosctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.7/talosctl-linux-arm64"
      sha256 "5d3c8edb177e779dce6f09252d66129162947985446ea3d80d5f2443a39ac058"

      def install
        bin.install "talosctl-linux-arm64" => "talosctl"
      end
    end
  end
end
