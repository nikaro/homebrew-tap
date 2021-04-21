class Rbw < Formula
  desc "Unofficial command-line client for Bitwarden"
  homepage "https://github.com/doy/rbw"
  url "https://github.com/doy/rbw/archive/1.2.0.tar.gz"
  sha256 "17fce8f474486550b83a2487ba7febd05d4f279cc7c53e70594d6f8ea223f5b7"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/rbw-1.2.0"
    sha256 cellar: :any_skip_relocation, catalina: "5f5b4d6a7bedea4f0fe29b6203ea582f0da3e40e8c5c1699ef0c724b8e4c5b22"
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
