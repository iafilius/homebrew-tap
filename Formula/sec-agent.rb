class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v1.9.2/sec-agent_v1.9.2_darwin_arm64.tar.gz"
  sha256 "cb0d201c06eccc681046d98c3c76317508db6bafea3e0ff3bd9441d1dda9be3f"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v1.9.2", shell_output("#{bin}/sec-agent version")
  end
end
