class Wireproxy < Formula
  desc "Wireguard client that exposes itself as a socks5 proxy or tunnels"
  homepage "https://github.com/octeep/wireproxy"
  url "https://github.com/octeep/wireproxy/archive/db9c1a6885f12d1c3c685dfdece0878127360878.tar.gz"
  sha256 "acba8c00c0633a5c1fb49531c59cb11af3ab7d436cf141078eb5e07d5a68a08f"
  license "ISC"
  head "https://github.com/octeep/wireproxy.git", branch: "master"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/wireproxy-0878127360878"
    sha256 cellar: :any_skip_relocation, big_sur: "1527cc4cd21bbde7e51fb60bd266a1a55955ae64189793e739830ca1ccd48239"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", *std_go_args
  end

  test do
    system "true"
  end
end
