class Kargo < Formula
  desc "CLI for Kargo"
  homepage "https://kargo.io"
  url "https://github.com/akuity/kargo.git",
      tag:      "v1.0.3",
      revision: "bb7afaad9750dfff61f47dd6c5288acbcdb6bce2"
  license "Apache-2.0"
  head "https://github.com/akuity/kargo.git", branch: "main"

  depends_on "go" => :build

  def install
    # Create a directory for the source code
    src_dir = "src/github.com/krancour/kargo"
    (buildpath/src_dir).install buildpath.children
    cd src_dir do
      ENV["GOPATH"] = buildpath
      ENV["VERSION"] = "v#{version}"
      ENV["GIT_COMMIT"] = Utils.safe_popen_read("git", "rev-parse", "HEAD").strip
      ENV["GIT_TREE_STATE"] = "clean"
      system "make", "build-cli"
      os = Utils.safe_popen_read("go", "env", "GOOS").strip
      arch = Utils.safe_popen_read("go", "env", "GOARCH").strip
      bin.install "bin/kargo-#{os}-#{arch}" => "kargo"
    end
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/kargo version --client")
  end
end
