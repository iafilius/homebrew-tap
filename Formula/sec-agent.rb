class SecAgent < Formula
  desc "macOS Enclave-Bound Session Agent for Encrypted Secrets"
  homepage "https://github.com/iafilius/sec-agent"
  url "https://github.com/iafilius/sec-agent/releases/download/v2.13.1/sec-agent_v2.13.1_darwin_arm64.tar.gz"
  version "2.13.1"
  sha256 "6f193b7d5372a45cca7b250e9e3a58437e4d1cfe9d0cc6404ce88afd359e4efa"
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
