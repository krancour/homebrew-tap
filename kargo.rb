# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kargo < Formula
  desc ""
  homepage ""
  version "1.2.0-rc.14"
  depends_on :macos

  on_intel do
    url "https://github.com/krancour/kargo/releases/download/v1.2.0-rc.14/kargo-darwin-amd64_1.2.0-rc.14_darwin_amd64"
    sha256 "649992420e052c3bf5b7907927eac0ecb0cab187c2c2ea3ec584f05b648e10e6"

    def install
      bin.install "kargo-darwin-amd64_1.2.0-rc.14_darwin_amd64" => "kargo-darwin-amd64"
    end
  end
  on_arm do
    url "https://github.com/krancour/kargo/releases/download/v1.2.0-rc.14/kargo-darwin-arm64_1.2.0-rc.14_darwin_arm64"
    sha256 "4ca5facc24eeeb5d2d612899f736204604b4e019e63f1c15396a3d4eee7b0043"

    def install
      bin.install "kargo-darwin-arm64_1.2.0-rc.14_darwin_arm64" => "kargo-darwin-arm64"
    end
  end
end