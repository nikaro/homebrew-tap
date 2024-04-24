class Talosctl < Formula
  desc "Talos Linux is a modern Linux distribution built for Kubernetes"
  homepage "https://github.com/siderolabs/talos"
  version "1.7.0"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/siderolabs/talos/releases/download/v1.7.0/talosctl-darwin-arm64"
      sha256 "acb03f0755d1aa981ea7485f606c2b8278f00e53a543bc80e070eaaf19df63b8"

      def install
        bin.install "talosctl-darwin-arm64" => "talosctl"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.7.0/talosctl-darwin-amd64"
      sha256 "334c57397c3bf654c6993d741fc79f20edf5abb38e3bbd90060f1f395514f973"

      def install
        bin.install "talosctl-darwin-amd64" => "talosctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/siderolabs/talos/releases/download/v1.7.0/talosctl-linux-arm64"
      sha256 "c9d6030de0e7b234fae601422cd341dde8cd08069155af719fbcc1bc6d931c15"

      def install
        bin.install "talosctl-linux-arm64" => "talosctl"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.7.0/talosctl-linux-amd64"
      sha256 "b48d94c59d85868ae506eb68e79a60d248b45ed68b3122e75a8b8bcccdc77a28"

      def install
        bin.install "talosctl-linux-amd64" => "talosctl"
      end
    end
  end
end
