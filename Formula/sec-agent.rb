class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.1.7/sec-agent_v2.1.7_darwin_arm64.tar.gz"
  version "2.1.7"
  sha256 "bcbb509a7d186cd8633e0a324c020219649e8ea72c58ae34772e04bed8e9a165"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v2.1.7", shell_output("#{bin}/sec-agent version")
  end
end
