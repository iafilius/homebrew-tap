class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v1.9.3/sec-agent_v1.9.3_darwin_arm64.tar.gz"
  sha256 "8fa3d3e9cede07c8e2ed2a628659a38a14e710fcb6c9bff437851c9a81bb1575"
  version "1.9.3"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec" => "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v1.9.3", shell_output("#{bin}/sec-agent version")
  end
end