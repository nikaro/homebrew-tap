class KubectlPassman < Formula
  desc "Missing link/glue between common password managers and kubectl"
  homepage "https://github.com/chrisns/kubectl-passman"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/chrisns/kubectl-passman/releases/download/v1.2.2/kubectl-passman-darwin-amd64.zip"
      sha256 "5491e46cd9c2398f5046358088a819c0813a396a738e3edf9264e95bb8040101"
    end
    if Hardware::CPU.arm?
      url "https://github.com/chrisns/kubectl-passman/releases/download/v1.2.2/kubectl-passman-darwin-arm64.zip"
      sha256 "430f46c3b231494269a9a33e73b7ffe13505817344168cd78bb3d9808c4576af"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/chrisns/kubectl-passman/releases/download/v1.2.2/kubectl-passman-linux-amd64.zip"
      sha256 "62c3f764fd7950c2ba2e2b3898a4d729a8be3ea6685e31258a8e3e5274b3568d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/chrisns/kubectl-passman/releases/download/v1.2.2/kubectl-passman-linux-arm64.zip"
      sha256 "4f9f6f0484199469e1fa70224fff32bc986bc7637f1bf9dfb866b14e5c7ccfc8"
    end
  end

  def install
    bin.install Dir["kubectl-passman-*"][0] => "kubectl-passman"
  end

  test do
    system "kubectl", "version"
  end
end
