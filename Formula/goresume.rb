# typed: false

class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.com/nikaro/goresume"
  url "https://github.com/nikaro/goresume/archive/refs/tags/0.3.12.tar.gz"
  sha256 "a4b0cb19cfa8008c5e9417600840618d47cf07a9a2f9279ef7d443bf81204fed"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goresume-0.3.12"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8cdde9bee0618ffe1fc4c5067c1cb4c81c534af4e657d8827b234e252c36bc2f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "45d70a6fc5699072bbd9c298b3dadec12261180f217b46c08291a031f1e6a40c"
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
