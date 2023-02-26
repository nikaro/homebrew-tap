# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML."
  homepage "https://github.con/nikaro/goresume"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/v0.0.2/goresume_0.0.2_darwin_amd64.tar.gz"
      sha256 "d8a4308f772efe844c0cfb95026246980ffecf40ef27a74dc8e7681f0cda56f8"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/nikaro/goresume/releases/download/v0.0.2/goresume_0.0.2_darwin_arm64.tar.gz"
      sha256 "8fece68ae08689bfd52b1a738420502c6e714adc98d3c7889011961550e966a0"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/nikaro/goresume/releases/download/v0.0.2/goresume_0.0.2_linux_amd64.tar.gz"
      sha256 "31c25be132bb927fad2593668cc8e49347c706e67577879ea77a67ae3476de93"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nikaro/goresume/releases/download/v0.0.2/goresume_0.0.2_linux_arm64.tar.gz"
      sha256 "7eee710b95de7738fe7abd0fc3a2621c775447450af5b5b6c4de92b751ffc3af"

      def install
        bin.install "goresume"
        generate_completions_from_executable(bin/"goresume", "completion")
      end
    end
  end
end
