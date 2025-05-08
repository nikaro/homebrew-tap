# typed: false

class KubectlAi < Formula
  desc "AI powered Kubernetes Assistant"
  homepage "https://github.com/GoogleCloudPlatform/kubectl-ai"
  url "https://github.com/GoogleCloudPlatform/kubectl-ai/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "d4547d69a2b1014ed23989349eb210829373d43b94514896d2d4fecb6bb3488a"
  license "Apache-2.0"

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
