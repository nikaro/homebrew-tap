# typed: false

class Chawan < Formula
  desc "Web browser for your terminal"
  homepage "https://sr.ht/~bptato/chawan/"
  url "https://git.sr.ht/~bptato/chawan/archive/19c573e794fc74cb57833f4d2cbe53e002958685.tar.gz"
  sha256 "efa0082af82aa01c4c162c292719e561e3adaf35bf6a71c5dfb1b9f36d0f8534"
  license "Unlicense"
  head "https://git.sr.ht/~bptato/chawan", branch: "master"

  depends_on "nim" => :build
  depends_on "pkgconf" => :build
  depends_on "libssh2"
  depends_on "ncurses"
  depends_on "openssl@3"

  uses_from_macos "curl"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "Chawan", shell_output("#{bin}/cha --version")
  end
end
