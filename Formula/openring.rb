class Openring < Formula
  desc "Webring for static site generators"
  homepage "https://sr.ht/~sircmpwn/openring/"
  url "https://git.sr.ht/~sircmpwn/openring",
    tag:      "1.0.1",
    revision: "51c8a2e1f2e72c09c0e3c7a3abe32b92d2944408"
  license "GPL-3.0-only"
  revision 1

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/openring-1.0.1_1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9a11695d614029a36b621e6ae512fdd56bad216db8c6f7a96819f037fd450878"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3c1495b9889bff9a34dafe7553031c6499346da8d2f29f2918e348e8070df4ee"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
