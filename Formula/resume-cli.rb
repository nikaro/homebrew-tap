require "language/node"

class ResumeCli < Formula
  desc "CLI tool to easily setup a new resume 📑"
  homepage "https://jsonresume.org"
  url "https://registry.npmjs.org/resume-cli/-/resume-cli-3.0.4.tgz"
  sha256 "1d139dc539e05f176072e4a449e38b8049e216d3aefa940d08e77913a3cd2fc9"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/resume-cli-3.0.4"
    sha256 cellar: :any, catalina: "50a3ca395f01b6175544af339cdec079e495dabf49ef81c1957a707bae71e324"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/resume", "--version"
  end
end
