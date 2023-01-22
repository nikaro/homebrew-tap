class Kubeshark < Formula
  desc "API traffic viewer for Kubernetes "
  homepage "https://github.com/kubeshark/kubeshark"
  license "Apache-2.0"
  version "38.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_darwin_amd64"
      sha256 "e27ea78560e936cc8dc341e77ec7f0df5824ee15fbf9b3e218af191c6e04da8e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_darwin_arm64"
      sha256 "4f0459a88e2e5b007decdd69c9855a7c45e466f229a43d3aea1a4d38a244b27c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_linux_amd64"
      sha256 "4f3423502e40d4390d304602837a2aa823fad165d53626df74b436c01de24be4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/kubeshark/kubeshark/releases/download/#{version}/kubeshark_linux_arm64"
      sha256 "4ec7f9345019fa4efac326a8305255fc5838bfcf744d7594cdcf5e91d48a704b"
    end
  end

  def install
    bin.install Dir["kubeshark_*"][0] => "kubeshark"
  end

  test do
    system "kubeshark", "version"
  end
end
