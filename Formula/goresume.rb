# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.con/nikaro/goresume"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/0.2.5/goresume_0.2.5_darwin_amd64.tar.gz"
      sha256 "12368fbf139717d7fa8193092c5d70ecb66972a30c9e972abfd42c91ed19538c"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/nikaro/goresume/releases/download/0.2.5/goresume_0.2.5_darwin_arm64.tar.gz"
      sha256 "5f5a2f1eca88e2af2b7b16cd8fc3b8d5b6bf3dc5e8f3eaa183308ab1a638b671"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nikaro/goresume/releases/download/0.2.5/goresume_0.2.5_linux_arm64.tar.gz"
      sha256 "7a7f555352738904d22d2b7659c3854f6c94380ccaa5441680fa6461f044c4a3"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/0.2.5/goresume_0.2.5_linux_amd64.tar.gz"
      sha256 "25dd02124890eca9323adfa1164a066bd20154af287f034d6f158475855e75dc"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end
end
