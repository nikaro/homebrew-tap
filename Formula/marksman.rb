class Marksman < Formula
  desc "Language Server Protocol for Markdown"
  homepage "https://github.com/artempyanykh/marksman"
  license "MIT"
  version "2022-11-25"

  on_macos do
    url "https://github.com/artempyanykh/marksman/releases/download/2022-11-25/marksman-macos"
    sha256 "99c23f5091a9e1eee7577c71caa18c48800d10fc0c737d1a56680bc7e271dae7"
    def install
      bin.install "marksman-macos" => "marksman"
    end
  end

  on_linux do
    url "https://github.com/artempyanykh/marksman/releases/download/2022-11-25/marksman-linux"
    sha256 "64c5216a3339c9d1e26eff0722d7679dcbf61d4c1703ed05d1220a5ad99eb0fb"
    def install
      bin.install "marksman-macos" => "marksman"
    end
  end

  test do
    system "marksman", "server", "--help"
  end
end
