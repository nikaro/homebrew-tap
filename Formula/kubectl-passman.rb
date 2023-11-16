class KubectlPassman < Formula
  desc "Missing link/glue between common password managers and kubectl"
  homepage "https://github.com/chrisns/kubectl-passman"
  url "https://github.com/chrisns/kubectl-passman/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "6da71353a39775e3a43788a9cc8cdbacf3204ec3ca52fa098fefa5d3963c10b7"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.VERSION=#{version}")
  end

  test do
    assert_match "kubectl-passman version #{version}", shell_output(bin/"kubectl-passman --version")
  end
end
