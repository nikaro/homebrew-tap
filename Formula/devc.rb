class Devc < Formula
  desc "CLI tool to manage your devcontainers"
  homepage "https://github.com/nikaro/devc"
  url "https://github.com/nikaro/devc/archive/v1.0.0-alpha.4.tar.gz"
  sha256 "16e4ab7d9b4f445892745905a32d3b8f50b909b3a95f0c0af81c4e5e40e08b81"
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
