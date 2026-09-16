class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.13.2/sec-agent_v2.13.2_darwin_arm64.tar.gz"
  version "2.13.2"
  sha256 "9668c1c1cc826c94382736731c133e95b955e9fa178dad0729301f8b7099324b"
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
