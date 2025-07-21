class Kat < Formula
  desc "TUI and rule-based rendering engine for Kubernetes manifests"
  homepage "https://github.com/MacroPower/kat"
  url "https://github.com/MacroPower/kat/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "b1c3e78bbb674fe24ac1bca9c935d9da099acde119d863a7582b315295ef3d60"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "helm"
  depends_on "kustomize"
  depends_on "yq"

  def install
    ldflags = %W[
      -s -w
      -X github.com/macropower/kat/pkg/version.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/kat"
  end

  test do
    assert_match(/^kat version #{version}/, shell_output("#{bin}/kat --version"))
  end
end
