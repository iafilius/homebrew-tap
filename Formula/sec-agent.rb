class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.1.5/sec-agent_v2.1.5_darwin_arm64.tar.gz"
  version "2.1.5"
  sha256 "7f7136cdab8cf86a8809a64aa904f3aaf8c172e1b0454ec906148cb8111bc2de"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  test do
    assert_match "v2.1.5", shell_output("#{bin}/sec-agent version")
  end
end
