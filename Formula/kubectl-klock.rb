# typed: false

class KubectlKlock < Formula
  desc "Kubectl plugin to render watch output in a more readable fashion"
  homepage "https://github.com/applejag/kubectl-klock"
  url "https://github.com/applejag/kubectl-klock/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "54c142f9647982483f0c8c5fea39128a3165ee993ccc47ed474a8e754c286e33"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/kubectl-klock-0.8.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4caedd848a2e08dcc57a60c3002c455f4d35cc7d568a00dda627f9a6bd204614"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8835363657f085a23dee7a6584b13d9936cc0e94320fcad4d4c94dc51e8cca64"
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
