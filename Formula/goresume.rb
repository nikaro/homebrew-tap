class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.com/nikaro/goresume"
  url "https://github.com/nikaro/goresume/archive/refs/tags/0.3.10.tar.gz"
  sha256 "91c448b76c124f281b6b080b3ba9b4c6af3d61c79a5ec4b013861878079b1f58"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goresume-0.3.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d6df2758ae84b1c8097b314da11e07fd759106fc38070ebd25d5c85262ea56d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "824479e9e42c63b9bcd2271cf3e466e9091c5b1fb5c0b44b2236609c3345eb83"
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
