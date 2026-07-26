class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.1.3/sec-agent_v2.1.3_darwin_arm64.tar.gz"
  version "2.1.3"
  sha256 "0509de1f8f91cf393a2a7dac86957dcaf5293ace39f0c6583d492713e5b30abd"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v2.1.3", shell_output("#{bin}/sec-agent version")
  end
end
