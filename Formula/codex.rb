# typed: false

require "language/node"

class Codex < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"
  url "https://registry.npmjs.org/@openai/codex/-/codex-0.1.2504172351.tgz"
  sha256 "3e7430e7d9e54fb766d438ee660062446bfcada18acbdec2d7fd59a251447ed7"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/codex-0.1.2504172351"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b09071d81d01d0444116475349b2ff0ff911a822384b816773c7ef137c614327"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9daf6b638e8541fb2fe23623d5dbdb4cac221a101505c197b041fe3c053646ae"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codex --version")
  end
end
