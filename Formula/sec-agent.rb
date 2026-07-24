class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v1.9.1/sec-agent_v1.9.1_darwin_arm64.tar.gz"
  sha256 "99dae75aa28d318711028b004df938053f78958bbbf5de005af8be36ebd84003"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v1.9.1", shell_output("#{bin}/sec-agent version")
  end
end
