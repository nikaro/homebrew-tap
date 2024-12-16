# typed: false

class Picocrypt < Formula
  desc "Command-line interface for Picocrypt"
  homepage "https://github.com/Picocrypt/CLI"
  url "https://github.com/Picocrypt/CLI/archive/refs/tags/1.45.tar.gz"
  sha256 "77f60e0934fd9a8994ef38d47a92096ae01455ae43bdeb6e79bbb28a7550951c"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    chdir "picocrypt" do
      system "go", "build", *std_go_args
    end
  end
end
