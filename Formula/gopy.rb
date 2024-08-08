class Gopy < Formula
  desc "CPython extension module generator from a go package"
  homepage "https://github.com/go-python/gopy"
  url "https://github.com/go-python/gopy/archive/refs/tags/v0.4.10.tar.gz"
  sha256 "1af560db83e0e92b6d6b2d8e7f487a4d8de2628810a7ffb70a16e8ce7a362181"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
