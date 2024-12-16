# typed: false

class Picocrypt < Formula
  desc "Command-line interface for Picocrypt"
  homepage "https://github.com/Picocrypt/CLI"
  url "https://github.com/Picocrypt/CLI/archive/refs/tags/1.45.tar.gz"
  sha256 "77f60e0934fd9a8994ef38d47a92096ae01455ae43bdeb6e79bbb28a7550951c"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/picocrypt-1.45"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bc500f5ecbed0e5e66ea63effdb89ede6a756c44ebedbbdc1eca9c8eddd6b150"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d5e80f8761c34862e6fb70039ebeb91823adfbd79e6832134a9acbb9dc83f2e6"
  end

  depends_on "go" => :build

  def install
    chdir "picocrypt" do
      system "go", "build", *std_go_args
    end
  end
end
