# rev1

class HelmLs < Formula
  desc "Language server for Helm"
  homepage "https://github.com/mrjosh/helm-ls"
  url "https://github.com/mrjosh/helm-ls/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "8773e8df3f5771e3736b3f68c5b5c386a3c94ac5ea591f8949ac815178dfaddf"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/helm-ls", "version"
  end
end
