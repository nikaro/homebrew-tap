class Wireproxy < Formula
  desc "Wireguard client that exposes itself as a socks5 proxy or tunnels"
  homepage "https://github.com/octeep/wireproxy"
  url "https://github.com/octeep/wireproxy/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "c03148266a8becc32e78a077db1b751b110be7326eda4081a07387b177cd740b"
  license "ISC"
  head "https://github.com/octeep/wireproxy.git", branch: "master"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/wireproxy-0878127360878"
    sha256 cellar: :any_skip_relocation, big_sur: "1527cc4cd21bbde7e51fb60bd266a1a55955ae64189793e739830ca1ccd48239"
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
