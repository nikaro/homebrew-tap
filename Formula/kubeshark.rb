class Kubeshark < Formula
  desc "API traffic viewer for Kubernetes"
  homepage "https://github.com/kubeshark/kubeshark"
  version "38.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_darwin_amd64"
      sha256 "b8baeeb61d4b226dfea7618f6bd8c65865a52e6f4488fe0a01bcb3fb7e513987"
    end
    if Hardware::CPU.arm?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_darwin_arm64"
      sha256 "9753173ffbf6ee6c7b8e857939769dba5e9ae0ebdfe8d4eb096615227e94ad57"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_linux_amd64"
      sha256 "255680662dd4651d16d2b98e2d9d3acc6133c4557c8c7106cf0b719aa81241ce"
    end
    if Hardware::CPU.arm?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_linux_arm64"
      sha256 "83da14d7e8ae6837140b38d5483178ca846449ef493c031d028c3b0979ae091a"
    end
  end

  def install
    bin.install Dir["kubeshark_*"][0] => "kubeshark"
  end

  test do
    system "#{bin}/kubeshark", "version"
  end
end
