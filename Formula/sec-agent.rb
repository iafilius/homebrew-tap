class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.9.0/sec-agent_v2.9.0_darwin_arm64.tar.gz"
  version "2.9.0"
  sha256 "6417a4172a2d65c7c3c4e70a18147bbf3a60d03d7faeba8d9a1e9661a2177bcd"
  license "GPL-3.0-or-later"

  depends_on :macos

  def install
    bin.install "sec-agent"
    bin.install_symlink bin/"sec-agent" => "sec"
  end

  def post_install
    system "#{bin}/sec-agent", "restart", "--hot-reload" rescue nil
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/sec-agent version")
  end
end
