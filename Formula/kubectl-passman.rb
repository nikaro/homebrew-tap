class KubectlPassman < Formula
  desc "Missing link/glue between common password managers and kubectl"
  homepage "https://github.com/chrisns/kubectl-passman"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/chrisns/kubectl-passman/releases/download/v1.2.3/kubectl-passman-darwin-amd64.zip"
      sha256 "d6d9138af60ec1a57645dac8e4ce93dadd84efe1802543e05bff45871dcec2e6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/chrisns/kubectl-passman/releases/download/v1.2.3/kubectl-passman-darwin-arm64.zip"
      sha256 "762bb02a15ba2ef7029a38a1ca7860a861c2f4bda4b241d32bf417aef7a57c29"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/chrisns/kubectl-passman/releases/download/v1.2.3/kubectl-passman-linux-amd64.zip"
      sha256 "dac6b4eb52ffae5c0b230144dd9fe1e4f573c5b34524edac4ff82e30b46c7c0a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/chrisns/kubectl-passman/releases/download/v1.2.3/kubectl-passman-linux-arm64.zip"
      sha256 "e5a0c2f3b0b66b0cb0a078420ecfd102a3f12ef63a05fc89d32d0e473c987c19"
    end
  end

  def install
    bin.install Dir["kubectl-passman-*"][0] => "kubectl-passman"
  end

  test do
    system "kubectl", "version"
  end
end
