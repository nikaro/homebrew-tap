# typed: false

class Tabby < Formula
  desc "Self-hosted AI coding assistant"
  homepage "https://www.tabbyml.com/"
  url "https://github.com/TabbyML/tabby/archive/refs/tags/v0.27.0.tar.gz"
  sha256 "25de1fc6e80eecfe13d60283b343fe7f7fcf1a170245b6c679800fdefa572894"
  license "Apache-2.0"
  head "https://github.com/TabbyML/tabby.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/tabby-0.27.0"
    sha256 cellar: :any,                 arm64_sonoma: "43444b0e6dcb304c24f60099b5a44ca1f33410473d09ebb9d2c585c2361b1cb0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7a65b595f8455d5c249b64b3a03f05551673afc93077b3a9524807bf87011515"
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
