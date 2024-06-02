class Goresume < Formula
  desc "Build HTML/PDF resume from JSON/YAML/TOML"
  homepage "https://github.com/nikaro/goresume"
  url "https://github.com/nikaro/goresume/archive/refs/tags/0.3.5.tar.gz"
  sha256 "27a620f3cc13b4be1894950efcdcd815bc0b595b7d4225870ab5d72e1cfe471c"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/goresume-0.3.5_1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4dd2dff63f3bfa9fb6633b0b1ff5fdf3b3ec9f88d8a0d908149721b30a9ca301"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "271b9821db5fe2384bcfebae56097d938e4ea7a2b391538a12d343bbc60dd6e8"
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
