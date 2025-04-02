# typed: false

class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.com/nikaro/goresume"
  url "https://github.com/nikaro/goresume/archive/refs/tags/0.3.21.tar.gz"
  sha256 "a2c3158adb755e7ec65e6f7627c3e2fb200e06e5b57ffa8eee78be4ed8eb40c0"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goresume-0.3.14"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7e255edb28e3e96b7f31f4deb0a2e5184e995c39dbe95f34de7b002bee4d7fca"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "89a420d68ec173db284f1558967960903315661158ea349c68b0d27d2021273d"
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
