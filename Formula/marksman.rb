class Marksman < Formula
  desc "Language Server Protocol for Markdown"
  homepage "https://github.com/artempyanykh/marksman"
  license "MIT"
  version "2022-12-23"

  on_macos do
    url "https://github.com/artempyanykh/marksman/releases/download/#{version}/marksman-macos"
    sha256 "6c940c7d897c5c0f86c454fa04405d88af0301e1213b2912f78f1c03372b9c7f"
  end

  on_linux do
    url "https://github.com/artempyanykh/marksman/releases/download/#{version}/marksman-linux"
    sha256 "e66869f0bbaa4c3ec661ce47e3ab5ea15b9143eb599c4cc1680e7f98bdcac3fb"
  end

  def install
    bin.install Dir["marksman-*"][0] => "marksman"
  end

  test do
    system "marksman", "server", "--help"
  end
end
