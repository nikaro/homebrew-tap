class Kubeshark < Formula
  desc "API traffic viewer for Kubernetes "
  homepage "https://github.com/kubeshark/kubeshark"
  license "Apache-2.0"
  version "37.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_darwin_amd64"
      sha256 "b72e48460405d51d982211605dc98861fe06bed858c08fd02f480a1d410bc7b6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_darwin_arm64"
      sha256 "409526dbe5c3a6f6480d9ebccc480046266db98312bb05c3e10262be781cd50a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_linux_amd64"
      sha256 "fb4bf8be97f3be0f67cea9679819f7bfdc66d14bd1683f04affe441d37e29885"
    end
    if Hardware::CPU.arm?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_linux_arm64"
      sha256 "1b0aacd226b74818928319d61b15b44684f22b692896c17fca811f598079fcba"
    end
  end

  def install
    bin.install Dir["kubeshark_*"][0] => "kubeshark"
  end

  test do
    system "kubeshark", "version"
  end
end
