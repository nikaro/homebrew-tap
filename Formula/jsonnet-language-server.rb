class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "b24835338786c97e8be3609e98cb7e8af70d5ed02da23d144bc1cfbab15f6abd"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/jsonnet-language-server-0.13.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7bfa359dadd0fa7b1aadfb2819a53872189a2501a7358d2500bc4256e67043ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8d95133e1134048f05c4d55db7c2ff1ffb218c008a21e40ff0dd705695d85c13"
  end

  depends_on "go" => :build

  def install
    ldflags = %W[-s -w -X main.version=#{version}]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match(/^jsonnet-language-server version #{version}$/, shell_output("#{bin}/jsonnet-language-server --version"))
  end
end
