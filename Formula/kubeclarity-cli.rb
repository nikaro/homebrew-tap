class KubeclarityCli < Formula
  desc "Management of SBOM and vulnerabilities of containers and filesystems"
  homepage "https://github.com/openclarity/kubeclarity"
  url "https://github.com/openclarity/kubeclarity/archive/refs/tags/v2.23.3.tar.gz"
  sha256 "51422df66779cff37d64598ef3c9550ca91010ebfe3240d3f316b50ad1f8442d"
  license "Apache-2.0"

  depends_on "go" => :build
  on_linux do
    depends_on "btrfs-progs" => :build
    depends_on "device-mapper" => :build
    depends_on "pkg-config" => :build
  end

  def install
    chdir "cli" do
      system "go", "build", *std_go_args
    end
  end
end
