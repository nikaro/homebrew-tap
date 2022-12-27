class HelmLs< Formula
  desc "Language server for Helm"
  homepage "https://github.com/mrjosh/helm-ls"
  url "https://github.com/mrjosh/helm-ls/archive/1552f4be6b43eb3fc6c61ce056f1d28f36650c62.tar.gz"
  sha256 "7b3e2f411feb2341026b2dabbcd2205f0b01aeb82cb438abae14a8baa2f16ef4"
  license "MIT"
  version "0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "helm_ls", "version"
  end
end
