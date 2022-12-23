class Openring < Formula
  desc "A webring for static site generators"
  homepage "https://sr.ht/~sircmpwn/openring/"
  url "https://git.sr.ht/~sircmpwn/openring",
    tag: "1.0.1",
    revision: "51c8a2e1f2e72c09c0e3c7a3abe32b92d2944408"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
