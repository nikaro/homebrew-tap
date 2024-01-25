class Talosctl < Formula
  desc "Talos Linux is a modern Linux distribution built for Kubernetes"
  homepage "https://github.con/siderolabs/talos"
  version "1.6.3"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.3/talosctl-darwin-arm64"
      sha256 "fa7a697fe2b1d2043dbb69218de758969f068f09a69c1525f0f7fcc8a003fdcb"

      def install
        bin.install "talosctl-darwin-arm64" => "talosctl"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.3/talosctl-darwin-amd64"
      sha256 "f86948ead49f3202f8a50db5f02eb2a5315fab46626379f980a3da0bdaab91c2"

      def install
        bin.install "talosctl-darwin-amd64" => "talosctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.3/talosctl-linux-amd64"
      sha256 "e2296700b8101fb91e554290e31ddcb1c2f9e2e5f33d31533b8f6bbb68c4e3ba"

      def install
        bin.install "talosctl-linux-amd64" => "talosctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/siderolabs/talos/releases/download/v1.6.3/talosctl-linux-arm64"
      sha256 "d841cbf4d4a3f5e80e0f9be2a7d75cf90bb2a4cb4129df0e3f5c4e204748331a"

      def install
        bin.install "talosctl-linux-arm64" => "talosctl"
      end
    end
  end
end
