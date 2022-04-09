class Wireproxy < Formula
  desc "Wireguard client that exposes itself as a socks5 proxy or tunnels"
  homepage "https://github.com/octeep/wireproxy"
  url "https://github.com/octeep/wireproxy/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "108175bff7e5158236acdd2a0b1fc129a799a52772885b8e835c5e84d24a7358"
  license "ISC"
  head "https://github.com/octeep/wireproxy.git", branch: "master"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/wireproxy-1.0.2"
    sha256 cellar: :any_skip_relocation, big_sur: "e218fe415507f47fa5a62d8478264a4c78997a70d48d1a6a3949d7f34926b4f0"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", *std_go_args, "./cmd/wireproxy"
  end

  test do
    system "true"
  end
end
