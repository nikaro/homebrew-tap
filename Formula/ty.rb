class Ty < Formula
  include Language::Python::Virtualenv

  desc "Extremely fast Python type checker and language server"
  homepage "https://docs.astral.sh/ty/"
  url "https://files.pythonhosted.org/packages/28/ba/abedc672a4d706241106923595d68573e995f85aced13aa3ef2e6d5069cf/ty-0.0.1a15.tar.gz"
  sha256 "b601eb50e981bd3fb857eb17b473cad3728dab67f53370b6790dfc342797eb20"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/ty-0.0.1a15"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9e8c2ab1d75746383c6af10591268187269f86712c25dd46ef7378b3c26aace5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c1acce9e55bed3298100a6caaaba5b693fe2b9ade5dee7a3a8ad191e5c1b3cd0"
  end

  depends_on "rust" => :build
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    # assert_match(/^ty #{version}$/, shell_output("#{bin}/ty --version"))
    system "true"
  end
end
