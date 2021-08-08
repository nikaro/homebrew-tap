class Devc < Formula
  desc "CLI tool to manage your devcontainers"
  homepage "https://github.com/nikaro/devc"
  url "https://github.com/nikaro/devc/archive/v1.0.0-alpha.4.tar.gz"
  sha256 "16e4ab7d9b4f445892745905a32d3b8f50b909b3a95f0c0af81c4e5e40e08b81"
  license "GPL-3.0-or-later"
  head "https://github.com/nikaro/devc.git"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/devc-1.0.0-alpha.4"
    sha256 cellar: :any_skip_relocation, catalina: "41de5870bd2956b8c0b556d4e5efd3ce29277887f34cd13ab6ce9cacf2e74fa6"
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
