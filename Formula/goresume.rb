# typed: false

class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.com/nikaro/goresume"
  url "https://github.com/nikaro/goresume/archive/refs/tags/0.3.21.tar.gz"
  sha256 "a2c3158adb755e7ec65e6f7627c3e2fb200e06e5b57ffa8eee78be4ed8eb40c0"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goresume-0.3.21"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1a905d95b20150a584191f6a4586acfa98d9f1e9bd448dd67c228a2d45e57481"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d87c93f8ac405bbab1e55f4a5bc533c89a015ee948ea2508d12884112c0fdd76"
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
