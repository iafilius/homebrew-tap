class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.1.6/sec-agent_v2.1.6_darwin_arm64.tar.gz"
  version "2.1.6"
  sha256 "39c53f12942e3cf5dcc94343b64dc4d97400f69b92c0805606edd300736be444"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v2.1.6", shell_output("#{bin}/sec-agent version")
  end
end
