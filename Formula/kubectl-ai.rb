# typed: false

class KubectlAi < Formula
  desc "AI powered Kubernetes Assistant"
  homepage "https://github.com/GoogleCloudPlatform/kubectl-ai"
  url "https://github.com/GoogleCloudPlatform/kubectl-ai/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "d4547d69a2b1014ed23989349eb210829373d43b94514896d2d4fecb6bb3488a"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/kubectl-ai-0.0.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d066b5548813867a4a5c10e84e201fe661798430b3e158f725507b0351dc4fe0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fff251b1d83e45acde7474fb7161b25f362696ab3ea291ac75f14e90f90a0412"
  end

  depends_on "go" => :build

  def install
    ldflags = %W[-s -w -X main.version=#{version}]
    system "go", "build", *std_go_args(ldflags:)
    generate_completions_from_executable(bin/"kubectl-ai", "completion")
  end

  test do
    assert_match(/^Usage:/, shell_output("#{bin}/kubectl-ai --help"))
  end
end
