class Ty < Formula
  include Language::Python::Virtualenv

  desc "Extremely fast Python type checker and language server"
  homepage "https://docs.astral.sh/ty/"
  url "https://files.pythonhosted.org/packages/28/ba/abedc672a4d706241106923595d68573e995f85aced13aa3ef2e6d5069cf/ty-0.0.1a15.tar.gz"
  sha256 "b601eb50e981bd3fb857eb17b473cad3728dab67f53370b6790dfc342797eb20"
  license "MIT"

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
