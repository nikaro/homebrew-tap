# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.con/nikaro/goresume"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nikaro/goresume/releases/download/0.3.3/goresume_0.3.3_darwin_arm64.tar.gz"
      sha256 "79121094eaec22449c2fd03797741ded1d5d16682b3ea1a4077a54d248b9718f"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/0.3.3/goresume_0.3.3_darwin_amd64.tar.gz"
      sha256 "1b81d55606fc4b7fe1344f7945f13cbb5b907c63dabea46a6b815894b9867eac"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nikaro/goresume/releases/download/0.3.3/goresume_0.3.3_linux_arm64.tar.gz"
      sha256 "235a5ed6da0f583f93ff536d631b782ce6817301219aaaf232530b7ef1a2022d"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/0.3.3/goresume_0.3.3_linux_amd64.tar.gz"
      sha256 "0bfde0c11b844b213059f7470942f33237dd0170361c4ac4aa35da999d469409"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end
end
