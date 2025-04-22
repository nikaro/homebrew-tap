# typed: false

require "language/node"

class Codex < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"
  url "https://registry.npmjs.org/@openai/codex/-/codex-0.1.2504211509.tgz"
  sha256 "8434ec79fb7a5ec10baaa2fb5a43ea7b285e4d85f19f374fe50ea170d2fe80a9"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/codex-0.1.2504211509"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "51299359d637f2a752b72301e824a9d1596af461c54d4f0c57c70248c057e69e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0f30bc1912e13feee48c8f14d1db460b2ed06c78ed5393c4d59ae44e4e7ebf15"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codex --version")
  end
end
