# typed: false

class Tabby < Formula
  desc "Self-hosted AI coding assistant"
  homepage "https://www.tabbyml.com/"
  url "https://github.com/TabbyML/tabby/archive/refs/tags/v0.26.0.tar.gz"
  sha256 "84dc5a09da77514a2e733000b49e50ba6b2e624ee3ddd6f41527e7961c5ca53c"
  license "Apache-2.0"
  head "https://github.com/TabbyML/tabby.git", branch: "main"

  depends_on "llvm" => :build
  depends_on "protobuf" => :build
  depends_on "rust" => :build
  depends_on "llama.cpp"
  depends_on "openssl@3"

  def install
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
