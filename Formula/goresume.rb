class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.com/nikaro/goresume"
  url "https://github.com/nikaro/goresume/archive/refs/tags/0.3.11.tar.gz"
  sha256 "88ae7a92b2034506eb65816f05139c8d610c7fc4c0b74d2978e777fd6630f40d"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goresume-0.3.11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "779492a7499ab4874e5c0b2912ecea20aeadc924c665f38c1da58dcfcbe1291d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "525637399360f850af0924070e8f47e21003faa241aeefeff089ea274eed33f8"
  end

  depends_on "go" => :build

  def install
    ldflags = %W[-s -w -X main.version=#{version}]
    system "go", "build", *std_go_args(ldflags:)
    generate_completions_from_executable(bin/"goresume", "completion")
  end

  test do
    assert_match(/^goresume version #{version}$/, shell_output("#{bin}/goresume --version"))
  end
end
