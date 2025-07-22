# typed: false

class KubectlKlock < Formula
  desc "Kubectl plugin to render watch output in a more readable fashion"
  homepage "https://github.com/applejag/kubectl-klock"
  url "https://github.com/applejag/kubectl-klock/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "0b3b389c7a9a84753626cf0d05cafb893674555b6efe777d2c94911613e53d69"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/kubectl-klock-0.8.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b32d01011f67ca09600935fcc27462cd314f9d844b835fb1034b5eb25c61ab9c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9416aa20672b30a9aef4c37163c0863d90a47b858cd62763ae4d32a72831182c"
  end

  depends_on "go" => :build

  def install
    ldflags = %W[-s -w -X main.version=#{version}]
    system "go", "build", *std_go_args(ldflags:)
    generate_completions_from_executable(bin/"kubectl-klock", "completion")
  end

  test do
    assert_match(/Usage:/, shell_output("#{bin}/kubectl-klock --help"))
  end
end
