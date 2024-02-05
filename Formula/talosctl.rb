class Talosctl < Formula
  desc "Talos Linux is a modern Linux distribution built for Kubernetes"
  homepage "https://github.com/siderolabs/talos"
  version "1.6.4"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.4/talosctl-darwin-arm64"
      sha256 "3d83092c651d0926fa2d4840a540d82a1904519c89672ebeee2db1844f9620db"

      def install
        bin.install "talosctl-darwin-arm64" => "talosctl"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.4/talosctl-darwin-amd64"
      sha256 "8e8a8271e4c3449fb2f845f8ae6a3ef153a006c5b08a4545b060e07ee10e986d"

      def install
        bin.install "talosctl-darwin-amd64" => "talosctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.4/talosctl-linux-amd64"
      sha256 "9346ae645f8dbcf1d63601c1dbf725d9e0475b225a9c483de872912fb9d87a01"

      def install
        bin.install "talosctl-linux-amd64" => "talosctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.4/talosctl-linux-arm64"
      sha256 "b1085ca8f86658532cadca71d77a013e203a60a6b16d3726a133e87ba4113ae1"

      def install
        bin.install "talosctl-linux-arm64" => "talosctl"
      end
    end
  end
end
