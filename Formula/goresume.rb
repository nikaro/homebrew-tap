class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.com/nikaro/goresume"
  url "https://github.com/nikaro/goresume/archive/refs/tags/0.3.12.tar.gz"
  sha256 "a4b0cb19cfa8008c5e9417600840618d47cf07a9a2f9279ef7d443bf81204fed"
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
