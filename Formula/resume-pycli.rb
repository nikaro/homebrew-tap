class ResumePycli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to easily setup a new resume"
  homepage "https://sr.ht/~nka/resume-pycli"
  url "https://files.pythonhosted.org/packages/75/7e/d844c55f585b188416e6c7ed887f206681c5e22025a0554c565923408b09/resume-pycli-1.3.0.tar.gz"
  sha256 "eaf6747ea4b81c82f9344bbeeddb0b9694d7924f004d8e69fc0ff27304ef4d28"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/resume-pycli-1.2.0"
    sha256 cellar: :any_skip_relocation, catalina: "2badefc08638ea8cf458fa9a8ad2292bb57a96b15d6a2f95b03444874b2b608a"
  end

  depends_on "python@3.9"

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/ed/d6/3ebca4ca65157c12bd08a63e20ac0bdc21ac7f3694040711f9fd073c0ffb/attrs-21.2.0.tar.gz"
    sha256 "ef6aaac3ca6cd92904cdd0d83f629a15f18053ec84e6432106f7a4d04ae4f5fb"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/21/83/308a74ca1104fe1e3197d31693a7a2db67c2d4e668f20f43a2fca491f9f7/click-8.0.1.tar.gz"
    sha256 "8c04c11192119b1ef78ea049e0a6f0463e4c48ef00a30160c704337586f3ad7a"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/39/11/8076571afd97303dfeb6e466f27187ca4970918d4b36d5326725514d3ed3/Jinja2-3.0.1.tar.gz"
    sha256 "703f484b47a6af502e743c9122595cc812b0271f661722403114f71a79d0f5a4"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/69/11/a69e2a3c01b324a77d3a7c0570faa372e8448b666300c4117a516f8b1212/jsonschema-3.2.0.tar.gz"
    sha256 "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e/MarkupSafe-2.0.1.tar.gz"
    sha256 "594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a"
  end

  resource "pdfkit" do
    url "https://files.pythonhosted.org/packages/a1/98/6988328f72fe3be4cbfcb6cbfc3066a00bf111ca7821a83dd0ce56e2cf57/pdfkit-0.6.1.tar.gz"
    sha256 "ef1da35b78d534197e7ce4a604a4a190e9aa769e56634957535f3479a50d8cd1"
  end

  resource "pyrsistent" do
    url "https://files.pythonhosted.org/packages/4d/70/fd441df751ba8b620e03fd2d2d9ca902103119616f0f6cc42e6405035062/pyrsistent-0.17.3.tar.gz"
    sha256 "2e636185d9eb976a18a8a8e96efce62f2905fea90041958d8cc2a189756ebf3e"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/resume", "version"
    system "#{bin}/resume", "init"
    system "#{bin}/resume", "validate"
  end
end
