# typed: false

require "language/node"

class ClaudeCode < Formula
  desc "Agentic coding tool that lives in your terminal"
  homepage "https://github.com/anthropics/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-0.2.122.tgz"
  sha256 "ac24489394c4167cfc92b94ebfbaa94c6a4bf0224bbff53b86b791bf08ef69a4"
  license :cannot_represent

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/claude-code-0.2.100"
    sha256 cellar: :any,                 arm64_sonoma: "9aea864d236f77d4e055d283c6d25790f293fba4946e787c8d6d6852832993f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "65eceb2eb8abbfdbf593a34bd9c5f1b113ca8b432e2df6cadd5e0338ae3f7b34"
  end

  depends_on "node"
  depends_on "pcre2"
  depends_on "ripgrep"
  depends_on "gh" => :optional
  depends_on "glab" => :optional

  def install
    system "npm", "install", *std_npm_args

    # Fix the problematic binary on macOS ARM
    if OS.mac? && Hardware::CPU.arm?
      # Path to the ripgrep.node binary and the module directory
      module_dir = libexec/"lib/node_modules/@anthropic-ai/claude-code/vendor/ripgrep/arm64-darwin"
      ripgrep_node = module_dir/"ripgrep.node"

      if ripgrep_node.exist?
        # Instead of modifying the binary (which fails due to header size),
        # we'll extract the library it needs and create a symlink at the expected location

        ohai "Using the system ripgrep instead of the bundled one"

        # The source path from the error message

        # Create a copy of ripgrep from brew in the expected location
        ripgrep_lib = Formula["ripgrep"].bin/"rg"
        if ripgrep_lib.exist?
          # Ensure the target directory exists
          target_dir = module_dir/"deps"
          mkdir_p target_dir unless target_dir.exist?

          # Create the symlink to the system ripgrep
          target_path = target_dir/"libripgrep.dylib"
          rm(target_path) if target_path.exist?
          ln_sf ripgrep_lib, target_path

          # Verify the symlink was created
          ohai "Created symlink: #{target_path} -> #{ripgrep_lib}"
        else
          opoo "Warning: Could not find system ripgrep executable"
        end
      else
        opoo "Warning: Could not find ripgrep.node binary"
      end
    end

    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "#{version} (Claude Code)", shell_output("#{bin}/claude --version")
  end
end
