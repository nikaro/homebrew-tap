# typed: false

class Tabby < Formula
  desc "Self-hosted AI coding assistant"
  homepage "https://www.tabbyml.com/"
  url "https://github.com/TabbyML/tabby/archive/refs/tags/v0.29.0.tar.gz"
  sha256 "0424c2d9c20d55efafdaff9211de17691a8017186da9c4e306e4bf177224f1cd"
  license "Apache-2.0"
  head "https://github.com/TabbyML/tabby.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/tabby-0.29.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "60bfb31d85055e3b72bec747f307c523f746b0983815b1c8951516b6264a3600"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b0eafc064fa4820f51f4f66bd1cbb4405230621bb9cbe393a6a1bd8c25e1a68"
  end

  depends_on "llvm" => :build
  depends_on "protobuf" => :build
  depends_on "rust" => :build
  depends_on "llama.cpp"
  depends_on "openssl@3"

  def install
    mkdir_p libexec/"bin"
    ln_s Formula["llama.cpp"].libexec/"llama-server", libexec/"bin"/"llama-server"
    system "cargo", "install",
      "--no-default-features", "--features", "prod",
      *std_cargo_args(path: "crates/tabby")
  end

  def tabby_log_path
    var/"log/#{name}.log"
  end

  def caveats
    <<~EOS
      Please note tabby expects to read its configuration file from
      #{Dir.home}/.tabby/config.toml

      For more information see https://tabby.tabbyml.com/docs/administration/model/

      For a list of the available models see https://tabby.tabbyml.com/docs/models/
    EOS
  end

  device = on_arch_conditional arm: "metal", intel: "cpu"
  service do
    run [opt_bin/"tabby", "serve", "--device", device]
    keep_alive true
    log_path f.tabby_log_path
    error_log_path f.tabby_log_path
    working_dir HOMEBREW_PREFIX
  end

  test do
    assert_match "Usage: tabby", shell_output("#{bin}/tabby --help")
    assert_match "tabby #{version}", shell_output("#{bin}/tabby --version")
  end
end
