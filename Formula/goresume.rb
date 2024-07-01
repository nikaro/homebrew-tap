class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.com/nikaro/goresume"
  url "https://github.com/nikaro/goresume/archive/refs/tags/0.3.10.tar.gz"
  sha256 "91c448b76c124f281b6b080b3ba9b4c6af3d61c79a5ec4b013861878079b1f58"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goresume-0.3.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7e4f7dfe02585b6083561edb9d18f7fd5bc7d45813bd70aeaf9ddc272faefa1d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6fcff850181e26130f3c70d36c6fa260e5d45d0f40d49e37fb08d592c4e9bb7c"
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
