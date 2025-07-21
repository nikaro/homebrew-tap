class Kat < Formula
  desc "TUI and rule-based rendering engine for Kubernetes manifests"
  homepage "https://github.com/MacroPower/kat"
  url "https://github.com/MacroPower/kat/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "b1c3e78bbb674fe24ac1bca9c935d9da099acde119d863a7582b315295ef3d60"
  license "Apache-2.0"
  revision 1

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/kat-0.21.0_1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "79379be50d2c95b5586fe27a9650a61a42ef21a687c0fc02d55b172e4402404a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "16518701b2d16fbf9b89a6381b9ca4ff66132e39e29282865dd5493ce5f770bb"
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
