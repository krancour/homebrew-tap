class Kargo < Formula
  desc "CLI for Kargo"
  homepage "https://kargo.io"
  url "https://github.com/akuity/kargo.git",
      tag:      "v1.0.3",
      revision: "bb7afaad9750dfff61f47dd6c5288acbcdb6bce2"
  license "Apache-2.0"
  head "https://github.com/akuity/kargo.git", branch: "main"

  bottle do
    root_url "https://github.com/krancour/homebrew-tap/releases/download/kargo-1.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "483ae7686e10d2a47c682b697f348bb173fcdfaebd4d494fd45b85da321942dd"
    sha256 cellar: :any_skip_relocation, ventura:       "af42e5f2fc8899793b5dc68608fdf3c532d3d79bdb2356b7def5f9e5317bfd59"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0504c6e70813ceafe1b1a6cc4fc92c702c688793da045a7e4809968096874265"
  end

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
