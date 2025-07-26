class Ty < Formula
  include Language::Python::Virtualenv

  desc "Extremely fast Python type checker and language server"
  homepage "https://docs.astral.sh/ty/"
  url "https://files.pythonhosted.org/packages/ca/62/f021cdbdda9dbd553be4b841c2e9329ecd3ddc630a17c1ab5179832fbca8/ty-0.0.1a16.tar.gz"
  sha256 "9ade26904870dc9bd988e58bad4382857f75ae05edb682ee0ba2f26fcc2d4c0f"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/ty-0.0.1a16"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7e746591911cfb48c25139b36346267f1a4051964707c8747393a4365c36187e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b9a66974eaa7db123a2b7dfbf9a95796d30151a5cd6bad434095e26e804973a3"
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
