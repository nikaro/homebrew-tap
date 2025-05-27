# typed: false

class KubectlKlock < Formula
  desc "Kubectl plugin to render watch output in a more readable fashion"
  homepage "https://github.com/applejag/kubectl-klock"
  url "https://github.com/applejag/kubectl-klock/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "98046621c92776d85c2c3309ee34d2181416c3a9c4af3c7975acef42de43b30a"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    ldflags = %W[-s -w -X main.version=#{version}]
    system "go", "build", *std_go_args(ldflags:)
    generate_completions_from_executable(bin/"kubectl-klock", "completion")
  end

  test do
    assert_match(/Usage:/, shell_output("#{bin}/kubectl-klock --help"))
  end
end
