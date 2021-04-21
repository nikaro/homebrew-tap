class Rbw < Formula
  desc "Unofficial command-line client for Bitwarden"
  homepage "https://github.com/doy/rbw"
  url "https://github.com/doy/rbw/archive/1.2.0.tar.gz"
  sha256 "17fce8f474486550b83a2487ba7febd05d4f279cc7c53e70594d6f8ea223f5b7"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/rbw-0.5.2"
    sha256 cellar: :any, catalina: "7548b82ab09a5f24f5e05c78da87e417f502329898d7e3c86f87364d85df138d"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"
  depends_on "pinentry"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/rbw", "--version"
    system "#{bin}/rbw", "config", "set", "email", "brew@example.net"
  end
end
