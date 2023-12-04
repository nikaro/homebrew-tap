# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.con/nikaro/goresume"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nikaro/goresume/releases/download/0.2.7/goresume_0.2.7_darwin_arm64.tar.gz"
      sha256 "e6742041cd8455d5d1b6143cca1ae408a8a21fe40861e8111efabf081def88f2"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/0.2.7/goresume_0.2.7_darwin_amd64.tar.gz"
      sha256 "8713f03a9445bd287cadb0054b1840d79009bf9764099101d2a4cd00ad54eac3"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/0.2.7/goresume_0.2.7_linux_amd64.tar.gz"
      sha256 "e13b9a7d87dfa772267b2a3910c41459c36e14eb980ffef44a940c0d18ab4ed7"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nikaro/goresume/releases/download/0.2.7/goresume_0.2.7_linux_arm64.tar.gz"
      sha256 "da17549ff5ef44c48165e804660551650ae26e435a1016346d6c8c47813ea990"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end
end
