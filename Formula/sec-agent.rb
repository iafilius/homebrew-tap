class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v1.9.4/sec-agent_v1.9.4_darwin_arm64.tar.gz"
  sha256 "c2c8ee2556c9c001f3dcd61a7adcf76059ef764af74ab3a0997bff9fa3f99c5e"
  version "1.9.4"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec" => "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v1.9.4", shell_output("#{bin}/sec-agent version")
  end
end