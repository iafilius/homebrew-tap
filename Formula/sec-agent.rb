class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.1.2/sec-agent_v2.1.2_darwin_arm64.tar.gz"
  version "2.1.2"
  sha256 "754df5e596a673c79349a29319a5de9c7bc83774557c3ab763093eb3d7de7d72"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v2.1.2", shell_output("#{bin}/sec-agent version")
  end
end
