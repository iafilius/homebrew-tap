class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.1.4/sec-agent_v2.1.4_darwin_arm64.tar.gz"
  version "2.1.4"
  sha256 "c77cc6cb80bae52c801035ee3057ab0a86a2e23b40dceab59ea57895728c29f4"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v2.1.4", shell_output("#{bin}/sec-agent version")
  end
end
