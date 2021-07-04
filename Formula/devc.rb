class Devc < Formula
  desc "CLI tool to manage your devcontainers"
  homepage "https://github.com/nikaro/devc"
  url "https://github.com/nikaro/devc/archive/v1.0.0-alpha.3.tar.gz"
  sha256 "7f486bb847157eeea799ff5581e6f0dd0078d540745c1f10911ba79ff7880fff"
  license "GPL-3.0-or-later"
  head "https://github.com/nikaro/devc.git"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", "-mod", "vendor", *std_go_args
  end

  test do
    system "#{bin}/devc", "init"
  end
end
