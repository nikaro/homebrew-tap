# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.con/nikaro/goresume"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nikaro/goresume/releases/download/0.3.0/goresume_0.3.0_darwin_arm64.tar.gz"
      sha256 "1e5ed8148277d48ee33dc8d14db90549c9390eb9eb4c052c3d442a41c262533a"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/0.3.0/goresume_0.3.0_darwin_amd64.tar.gz"
      sha256 "2be642a358a8713ccfb89fba14c4c7a9b9abda7abd428655f40d2188743c12b0"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nikaro/goresume/releases/download/0.3.0/goresume_0.3.0_linux_arm64.tar.gz"
      sha256 "e7491baa3928a64006c41601512cb0a2853f93bcff19f687ae6f79f8e36573c9"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/0.3.0/goresume_0.3.0_linux_amd64.tar.gz"
      sha256 "bc21c2e769fbeb66b491fe210636dc65646e05416263ecaa77a11cc46e347128"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end
end
