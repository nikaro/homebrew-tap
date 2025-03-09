# typed: false

class Picocrypt < Formula
  desc "Command-line interface for Picocrypt"
  homepage "https://github.com/Picocrypt/CLI"
  url "https://github.com/Picocrypt/CLI/archive/refs/tags/2.10.tar.gz"
  sha256 "e42337bd69f6f15ac221019f540ce177f5910883ee8c03aaea09fc4714d6cbff"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/picocrypt-2.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "717cbb64c37722c6da57db58da1fff527d06eb4d0b6815ec81265893e2a2d526"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d1fc74f47651968deca2c3e9eee1c9804da34433afb1870cfe68d8745063feed"
  end

  depends_on "go" => :build

  def install
    chdir "picocrypt" do
      system "go", "build", *std_go_args
    end
  end
end
