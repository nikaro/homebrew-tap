# typed: false

class KubectlKlock < Formula
  desc "Kubectl plugin to render watch output in a more readable fashion"
  homepage "https://github.com/applejag/kubectl-klock"
  url "https://github.com/applejag/kubectl-klock/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "98046621c92776d85c2c3309ee34d2181416c3a9c4af3c7975acef42de43b30a"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/kubectl-klock-0.8.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "58106d8fec71affdd9f3fcc94fb5d128ecf9186f8be70298103681766611d841"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d2be739cd3d5ff4f55314049d551fdb52744e77a256d84c8ffcf03adcab590d3"
  end

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
