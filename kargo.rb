# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kargo < Formula
  desc "CLI for Kargo"
  homepage "https://kargo.io"
  version "1.2.0-rc.28"
  license "Apache-2.0"
  depends_on :macos

  on_intel do
    url "https://github.com/krancour/kargo/releases/download/v1.2.0-rc.28/kargo-darwin-amd64"
    sha256 "f8ed9e2ad493298b113e6d5b47ee6e9479c72b6d26d762da6af91424e87f015c"

    def install
      bin.install "kargo-darwin-amd64" => "kargo"
    end
  end
  on_arm do
    url "https://github.com/krancour/kargo/releases/download/v1.2.0-rc.28/kargo-darwin-arm64"
    sha256 "5fb1d66f52d1e2236ac317b0f2856e3aced816877adac4e9e3597f8986818c6b"

    def install
      bin.install "kargo-darwin-arm64" => "kargo"
    end
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/kargo version --client")
  end
end