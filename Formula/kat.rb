class Kat < Formula
  desc "TUI and rule-based rendering engine for Kubernetes manifests"
  homepage "https://github.com/MacroPower/kat"
  url "https://github.com/MacroPower/kat/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "b1c3e78bbb674fe24ac1bca9c935d9da099acde119d863a7582b315295ef3d60"
  license "Apache-2.0"
  revision 1

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/kat-0.21.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f71cdfb0f35c044b0e5b5ae0737c1abc08df5cc864b0feb931191fcf7b664af6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa0cbc6335535d6f64b14b91b1523015fc764bd36e04b5a12efa7cd9d1655663"
  end

  depends_on "go" => :build
  depends_on "helm"
  depends_on "kustomize"
  depends_on "yq"

  def install
    ldflags = %W[-s -w -X github.com/macropower/kat/pkg/version.Version=#{version}]
    system "go", "build", *std_go_args(ldflags:), "./cmd/kat"
    generate_completions_from_executable(bin/"kat", "completion")
  end

  test do
    assert_match(/^kat version #{version}/, shell_output("#{bin}/kat --version"))
  end
end
