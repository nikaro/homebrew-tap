class Basedpyright < Formula
  include Language::Python::Virtualenv

  desc "Pyright fork with various improvements and built-in pylance features"
  homepage "https://github.com/DetachHead/basedpyright"
  url "https://files.pythonhosted.org/packages/10/56/0b764d7a0495a727057657d9541833be13467a0c36b8970cbe4ed8b9891a/basedpyright-1.15.1.tar.gz"
  sha256 "76e67453a3c3839506952de9f620d55aa1e3fcf2dbb276405df878bc83a185ee"
  license "MIT"
  revision 1

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/basedpyright-1.15.1_1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d1063d0d0e72077f60fc246c40ab0243ee1a233a4bbc4516ed3ea0789250ce09"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4abfed0ccec4ae6a751df0a5e63c705cf15fefe7cdbb239ece9aeebf43d6bf14"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build
  depends_on "python@3.12"

  resource "nodejs-wheel-binaries" do
    url "https://files.pythonhosted.org/packages/36/7a/9c3e424382eda040b01f344b7a64b11d2e4decc2c6d381f7ca68751603f8/nodejs_wheel_binaries-20.16.0.tar.gz"
    sha256 "85649da01bb3d0d3c9237d28545180254cda5417b4e2c219f53face0103fb2bf"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"broken.py").write <<~EOS
      def wrong_types(a: int, b: int) -> str:
          return a + b
    EOS
    output = pipe_output("#{bin}/basedpyright broken.py 2>&1")
    assert_match "error: Expression of type \"int\" is incompatible with return type \"str\"", output
  end
end
