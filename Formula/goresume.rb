class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.com/nikaro/goresume"
  url "https://github.com/nikaro/goresume/archive/refs/tags/0.3.6.tar.gz"
  sha256 "859cf2faea16e0ac58987a6fe7d474919ede0743ebb946c36f49b30a48b166b5"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goresume-0.3.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ea6db3ddf4b8857058951f7e04a9ff8432564160c522d107443c8982b91043cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "40df112b866845d0ef5ab851cbe5218c3d32c099fe916104f9a1376b674ff7d8"
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
