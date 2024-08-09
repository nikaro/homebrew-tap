require "language/node"

class Basedpyright < Formula
  desc "Pyright fork with various improvements and built-in pylance features"
  homepage "https://github.com/DetachHead/basedpyright"
  url "https://registry.npmjs.org/basedpyright/-/basedpyright-1.15.2.tgz"
  sha256 "c9e0dcceb4c09c8a5426eb544c1c1991fd27415f313c12e594e1c3373bea6aa4"
  license "MIT"
  revision 1
  head "https://github.com/detachhead/basedpyright.git", branch: "main"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/basedpyright-1.15.2_1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9830c2503f2a5b4330e8d165d8e1c6cab3297ebba8e9480ac7fea72067df0d84"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "045d9936beb4da578bedfe6003bc040559520b7f262ce65cbb9fab9cb1c19766"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/pyright" => "basedpyright"
    bin.install_symlink libexec/"bin/pyright-langserver" => "basedpyright-langserver"
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
