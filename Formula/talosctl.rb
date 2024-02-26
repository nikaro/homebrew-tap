class Talosctl < Formula
  desc "Talos Linux is a modern Linux distribution built for Kubernetes"
  homepage "https://github.com/siderolabs/talos"
  version "1.6.5"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.5/talosctl-darwin-arm64"
      sha256 "d9654e4db9b264fb4ed369240d1108b8025df70fc159c2e8587f13a6ee5ea938"

      def install
        bin.install "talosctl-darwin-arm64" => "talosctl"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.5/talosctl-darwin-amd64"
      sha256 "827c47cc2656490a82070914c4f3f4e8b0b4202bb9dd2394980e8cb15b81aaa5"

      def install
        bin.install "talosctl-darwin-amd64" => "talosctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.5/talosctl-linux-amd64"
      sha256 "7eb9261a86a9b1d4842d81e3966d269f122d7ce61bcc954f1ec7e2f4b6ca07d6"

      def install
        bin.install "talosctl-linux-amd64" => "talosctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.5/talosctl-linux-arm64"
      sha256 "c9250db32f20ed21a6f6e2f6e9f99c4f438fc8be55dba57e5cf985a9000c44a4"

      def install
        bin.install "talosctl-linux-arm64" => "talosctl"
      end
    end
  end
end
