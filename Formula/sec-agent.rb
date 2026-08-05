class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.3.0/sec-agent_v2.3.0_darwin_arm64.tar.gz"
  version "2.3.0"
  sha256 "264811469cb2f2a30a39816e02cf9a5123d98be49aa905542b834fb9fbe226f4"
  license "GPL-3.0-or-later"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/sec-agent version")
  end
end
