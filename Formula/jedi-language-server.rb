# typed: false

class JediLanguageServer < Formula
  include Language::Python::Virtualenv

  desc "Language server for Jedi"
  homepage "https://github.com/pappasam/jedi-language-server"
  url "https://files.pythonhosted.org/packages/93/d1/5844be2a4959a8d0b6ab21703e0242719c868aedb6663f1f29d4438ed966/jedi_language_server-0.42.0.tar.gz"
  sha256 "db818d956c16f79a32bbde4c6f7189282725977246199b09ac8155429432632c"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/jedi-language-server-0.41.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d8eb1036693c60459347d8280937a127dfe48dd23f2a0bb58af945e325ce99fb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cfa19f17c7f0000aed6fa554b3ab0a344275504ca9439f662d3432f1aeba5309"
  end

  depends_on "python"

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/fc/0f/aafca9af9315aee06a89ffde799a10a582fe8de76c563ee80bbcdc08b3fb/attrs-24.2.0.tar.gz"
    sha256 "5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346"
  end

  resource "cattrs" do
    url "https://files.pythonhosted.org/packages/64/65/af6d57da2cb32c076319b7489ae0958f746949d407109e3ccf4d115f147c/cattrs-24.1.2.tar.gz"
    sha256 "8028cfe1ff5382df59dd36474a86e02d817b06eaf8af84555441bac915d2ef85"
  end

  resource "docstring-to-markdown" do
    url "https://files.pythonhosted.org/packages/7a/ad/6a66abd14676619bd56f6b924c96321a2e2d7d86558841d94a30023eec53/docstring-to-markdown-0.15.tar.gz"
    sha256 "e146114d9c50c181b1d25505054a8d0f7a476837f0da2c19f07e06eaed52b73d"
  end

  resource "jedi" do
    url "https://files.pythonhosted.org/packages/d6/99/99b493cec4bf43176b678de30f81ed003fd6a647a301b9c927280c600f0a/jedi-0.19.1.tar.gz"
    sha256 "cf0496f3651bc65d7174ac1b7d043eff454892c708a87d1b683e57b569927ffd"
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
