class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.13.1.tar.gz"
  sha256 "00341c5bd1ea8b2eb2be61cc26cdba5a6c6b678c30d9b3f55a625e8db40d1bfa"
  license "AGPL-3.0-only"

  depends_on "go" => :build

  def install
    ldflags = %W[-s -w -X main.version=#{version}]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match(/^jsonnet-language-server version #{version}$/, shell_output("#{bin}/jsonnet-language-server --version"))
  end
end
