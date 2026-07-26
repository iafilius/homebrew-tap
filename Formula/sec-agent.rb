class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.1.1/sec-agent_v2.1.1_darwin_arm64.tar.gz"
  version "2.1.1"
  sha256 "052ffd6d7bc0d0465442c7b152899a54af8d82bd59067ef3e4b0b27f5ddeb68c"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v2.1.1", shell_output("#{bin}/sec-agent version")
  end
end
