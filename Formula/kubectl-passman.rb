class KubectlPassman < Formula
  desc "Missing link/glue between common password managers and kubectl"
  homepage "https://github.com/chrisns/kubectl-passman"
  url "https://github.com/chrisns/kubectl-passman/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "6da71353a39775e3a43788a9cc8cdbacf3204ec3ca52fa098fefa5d3963c10b7"
  license "MIT"

  bottle do
    root_url "https://github.com/nikaro/homebrew-tap/releases/download/kubectl-passman-1.2.3"
    sha256 cellar: :any_skip_relocation, ventura:      "4b5e0e8d486290fccc80597cfb4a964e6f753ff63b41019d3cd197985e5887c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f2a1cf3b344bf0492bb953828a1b5ff936ad187e8bff4b329af31525cd73623e"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.VERSION=#{version}")
  end

  test do
    assert_match "kubectl-passman version #{version}", shell_output(bin/"kubectl-passman --version")
  end
end
