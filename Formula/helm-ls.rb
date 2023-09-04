# rev1

class HelmLs < Formula
  desc "Language server for Helm"
  homepage "https://github.com/mrjosh/helm-ls"
  url "https://github.com/mrjosh/helm-ls/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "8773e8df3f5771e3736b3f68c5b5c386a3c94ac5ea591f8949ac815178dfaddf"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/helm-ls-0.0.5"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:      "6247e203f73911607338e48c6ddce08c693e526a55293a0a08332c7deab5b260"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fc5b9ece6c9cf97cbb838e97f87f4b58d14cbcd5d75f0c370b85975cac2eb958"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/helm-ls", "version"
  end
end
