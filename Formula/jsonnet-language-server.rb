class JsonnetLanguageServer < Formula
  desc "Language Server Protocol (LSP) server for Jsonnet"
  homepage "https://github.com/grafana/jsonnet-language-server"
  url "https://github.com/grafana/jsonnet-language-server/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "b24835338786c97e8be3609e98cb7e8af70d5ed02da23d144bc1cfbab15f6abd"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/jsonnet-language-server-0.14.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "cc3901a7be514582fd9f7e343b9c2cf0e3f1c3c9515fd9c3e6c042b5bbaf8750"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "42a23784ce8f86ec5bb0306dae1919268771cdc549e574fe1109915749716518"
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
