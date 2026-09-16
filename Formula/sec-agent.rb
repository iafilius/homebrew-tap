class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.13.2/sec-agent_v2.13.2_darwin_arm64.tar.gz"
  version "2.13.2"
  sha256 "d9b3e3faf01c84af7e20ef7b70936aa27ea9804c025ba5f800dc2f15c2ae3210"
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
