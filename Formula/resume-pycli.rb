class ResumePycli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to easily setup a new resume"
  homepage "https://sr.ht/~nka/resume-pycli"
  url "https://files.pythonhosted.org/packages/12/75/d4f2a5323538b50dc4c9ff56578e02001159b858b565e88570e9d7d5f0fb/resume-pycli-1.2.0.tar.gz"
  sha256 "4de76b08bbe1ee6d6f8a00070db44d2d3352a833750f387e87c2b9dcfc57f724"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/resume-pycli-1.1.3"
    sha256 cellar: :any_skip_relocation, catalina: "c0c97c168a17c79e31232885c08f43568e4ba57ef51884b2feb966cbf779b9f9"
  end

  depends_on "python@3.9"

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/ed/d6/3ebca4ca65157c12bd08a63e20ac0bdc21ac7f3694040711f9fd073c0ffb/attrs-21.2.0.tar.gz"
    sha256 "ef6aaac3ca6cd92904cdd0d83f629a15f18053ec84e6432106f7a4d04ae4f5fb"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/d5/99/286fd2fdfb501620a9341319ba47444040c7b3094d3b6c797d7281469bf8/click-8.0.0.tar.gz"
    sha256 "7d8c289ee437bcb0316820ccee14aefcb056e58d31830ecab8e47eda6540e136"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/7a/0c/23cbcf515b5394e9f59a3e6629f26e1142b92d474ee0725a26aa5a3bcf76/Jinja2-3.0.0.tar.gz"
    sha256 "ea8d7dd814ce9df6de6a761ec7f1cac98afe305b8cdc4aaae4e114b8d8ce24c5"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/69/11/a69e2a3c01b324a77d3a7c0570faa372e8448b666300c4117a516f8b1212/jsonschema-3.2.0.tar.gz"
    sha256 "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/67/6a/5b3ed5c122e20c33d2562df06faf895a6b91b0a6b96a4626440ffe1d5c8e/MarkupSafe-2.0.0.tar.gz"
    sha256 "4fae0677f712ee090721d8b17f412f1cbceefbf0dc180fe91bab3232f38b4527"
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
