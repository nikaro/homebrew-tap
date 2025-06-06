# typed: false

class PuppetLint < Formula
  desc "Puppet manifests linter"
  homepage "https://github.com/puppetlabs/puppet-lint"
  url "https://github.com/puppetlabs/puppet-lint/archive/refs/tags/v4.3.0.tar.gz"
  sha256 "0c06c52e408b0352ded39c707df97b3c0d58bce350e7bbcff8ed6b4c8165be72"
  license "MIT"
  head "https://github.com/puppetlabs/puppet-lint.git", branch: "main"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/puppet-lint-4.3.0"
    sha256 cellar: :any,                 arm64_sonoma: "4d3003b73e5a758b71adfb4768b2807219f4b639fdbed886ea05447f75bf0fb1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "862ffab2b424ff13b2766d16b1a1794939a3d3e50d2a83482ae8011732544342"
  end

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    system "bundle", "install", "--without", "development", "test"
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files libexec/"bin", GEM_HOME: ENV["GEM_HOME"]
  end

  test do
    assert_match "#{name} #{version}", shell_output("#{bin}/#{name} --version")
  end
end
