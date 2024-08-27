# typed: false

class Gopy < Formula
  desc "CPython extension module generator from a go package"
  homepage "https://github.com/go-python/gopy"
  url "https://github.com/go-python/gopy/archive/refs/tags/v0.4.10.tar.gz"
  sha256 "1af560db83e0e92b6d6b2d8e7f487a4d8de2628810a7ffb70a16e8ce7a362181"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/gopy-0.4.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "21474763497a9704c02e14d2e72d1ac22ce518983c62267c7404c562e4cb56e4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e701895e5676c7172761e3f00f16e44dfc1dbc655209de3fb001626d31ea00dd"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
