class Devc < Formula
  desc "CLI tool to manage your devcontainers"
  homepage "https://github.com/nikaro/devc"
  url "https://github.com/nikaro/devc/archive/v1.0.0-alpha.3.tar.gz"
  sha256 "7f486bb847157eeea799ff5581e6f0dd0078d540745c1f10911ba79ff7880fff"
  license "GPL-3.0-or-later"
  head "https://github.com/nikaro/devc.git"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/devc-1.0.0-alpha.3"
    sha256 cellar: :any_skip_relocation, catalina: "b43e65cad0e604af4d4e6ffb6925c1328f09c65b0d85af6170023d1840cd8ee5"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", "-mod", "vendor", *std_go_args
  end

  test do
    system "#{bin}/devc", "init"
  end
end
