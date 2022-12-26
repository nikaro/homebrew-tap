class Marksman < Formula
  desc "Language Server Protocol for Markdown"
  homepage "https://github.com/artempyanykh/marksman"
  license "MIT"
  version "2022-12-19"

  on_macos do
    url "https://github.com/artempyanykh/marksman/releases/download/#{version}/marksman-macos"
    sha256 "fe3de5bce0caab3f54619fb795f749e23f4c0555c0a474f1d7aa0047f7eb68eb"
  end

  on_linux do
    url "https://github.com/artempyanykh/marksman/releases/download/#{version}/marksman-linux"
    sha256 "b559118400f174ad48c6a1aae2bebbbe2171d346c38476bbbeb5ee296465ed37"
  end

  def install
    bin.install Dir["marksman-*"][0] => "marksman"
  end

  test do
    system "marksman", "server", "--help"
  end
end
