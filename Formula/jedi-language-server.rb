# typed: false

class JediLanguageServer < Formula
  include Language::Python::Virtualenv

  desc "Language server for Jedi"
  homepage "https://github.com/pappasam/jedi-language-server"
  url "https://files.pythonhosted.org/packages/51/ca/97ec6c7acc8e7718816283d3140ebd9601781d731be753c8d0eb97fca541/jedi_language_server-0.44.0.tar.gz"
  sha256 "276536bd00e64e65753d54cd35237d62730daffd65292dc8510d3063ebaefe4d"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/jedi-language-server-0.43.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "15ab972ce557ca7eb9bd8f324e13e5fc16b2557a4e3951242b9950e922db6d6d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c2fbe85fa8d1a4542ead6aed04ddb0df1c27a3f4bb963bf9a068220bf4d1c08e"
  end

  depends_on "python"

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/5a/b0/1367933a8532ee6ff8d63537de4f1177af4bff9f3e829baf7331f595bb24/attrs-25.3.0.tar.gz"
    sha256 "75d7cefc7fb576747b2c81b4442d4d4a1ce0900973527c011d1030fd3bf4af1b"
  end

  resource "cattrs" do
    url "https://files.pythonhosted.org/packages/29/7b/da4aa2f95afb2f28010453d03d6eedf018f9e085bd001f039e15731aba89/cattrs-24.1.3.tar.gz"
    sha256 "981a6ef05875b5bb0c7fb68885546186d306f10f0f6718fe9b96c226e68821ff"
  end

  resource "docstring-to-markdown" do
    url "https://files.pythonhosted.org/packages/58/1f/16e6d4026e94224d662dcd344dcd3563bc8a74a272f2c27b325793cad5fc/docstring_to_markdown-0.16.tar.gz"
    sha256 "097bf502fdf040b0d019688a7cc1abb89b98196801448721740e8aa3e5075627"
  end

  resource "importlib-metadata" do
    url "https://files.pythonhosted.org/packages/33/08/c1395a292bb23fd03bdf572a1357c5a733d3eecbab877641ceacab23db6e/importlib_metadata-8.6.1.tar.gz"
    sha256 "310b41d755445d74569f993ccfc22838295d9fe005425094fad953d7f15c8580"
  end

  resource "jedi" do
    url "https://files.pythonhosted.org/packages/72/3a/79a912fbd4d8dd6fbb02bf69afd3bb72cf0c729bb3063c6f4498603db17a/jedi-0.19.2.tar.gz"
    sha256 "4770dc3de41bde3966b02eb84fbcf557fb33cce26ad23da12c742fb50ecb11f0"
  end

  resource "lsprotocol" do
    url "https://files.pythonhosted.org/packages/9d/f6/6e80484ec078d0b50699ceb1833597b792a6c695f90c645fbaf54b947e6f/lsprotocol-2023.0.1.tar.gz"
    sha256 "cc5c15130d2403c18b734304339e51242d3018a05c4f7d0f198ad6e0cd21861d"
  end

  resource "parso" do
    url "https://files.pythonhosted.org/packages/66/94/68e2e17afaa9169cf6412ab0f28623903be73d1b32e208d9e8e541bb086d/parso-0.8.4.tar.gz"
    sha256 "eb3a7b58240fb99099a345571deecc0f9540ea5f4dd2fe14c2a99d6b281ab92d"
  end

  resource "pygls" do
    url "https://files.pythonhosted.org/packages/86/b9/41d173dad9eaa9db9c785a85671fc3d68961f08d67706dc2e79011e10b5c/pygls-1.3.1.tar.gz"
    sha256 "140edceefa0da0e9b3c533547c892a42a7d2fd9217ae848c330c53d266a55018"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/0e/3e/b00a62db91a83fff600de219b6ea9908e6918664899a2d85db222f4fbf19/typing_extensions-4.13.0.tar.gz"
    sha256 "0a4ac55a5820789d87e297727d229866c9650f6521b64206413c4fbada24d95b"
  end

  resource "zipp" do
    url "https://files.pythonhosted.org/packages/3f/50/bad581df71744867e9468ebd0bcd6505de3b275e06f202c2cb016e3ff56f/zipp-3.21.0.tar.gz"
    sha256 "2c9958f6430a2040341a52eb608ed6dd93ef4392e02ffe219417c1b28b5dd1f4"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    json = <<~JSON
      {
        "jsonrpc": "2.0",
        "id": 1,
        "method": "initialize",
        "params": {
          "rootUri": null,
          "capabilities": {}
        }
      }
    JSON
    input = "Content-Length: #{json.size}\r\n\r\n#{json}"
    pipe_output(bin/"jedi-language-server", input)
  end
end
