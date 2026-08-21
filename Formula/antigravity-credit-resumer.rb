class AntigravityCreditResumer < Formula
  desc "Auto-resumes Antigravity AI Cascades on credit refill & switches models"
  homepage "https://github.com/iafilius/antigravity-credit-resumer"
  url "https://github.com/iafilius/antigravity-credit-resumer/releases/download/v0.7.3/antigravity-credit-resumer-0.7.3.vsix"
  sha256 "757af31709c6979e1e7f0dd50c1dd6c47f4b62337f37e365bb07313cb695afe6"
  license "MIT"

  def install
    pkgshare.install "antigravity-credit-resumer-#{version}.vsix"

    (bin/"antigravity-credit-resumer").write <<~EOS
      #!/usr/bin/env bash
      VSIX_PATH="#{opt_pkgshare}/antigravity-credit-resumer-#{version}.vsix"
      case "$1" in
        install)
          if command -v antigravity-ide >/dev/null 2>&1; then
            echo "Installing extension into Antigravity IDE..."
            antigravity-ide --install-extension "$VSIX_PATH" --force
          fi
          if command -v code >/dev/null 2>&1; then
            echo "Installing extension into VS Code..."
            code --install-extension "$VSIX_PATH" --force
          fi
          ;;
        path)
          echo "$VSIX_PATH"
          ;;
        version|--version|-v)
          echo "antigravity-credit-resumer v#{version}"
          ;;
        *)
          echo "Antigravity Credit Resumer v#{version}"
          echo "VSIX Package: $VSIX_PATH"
          echo ""
          echo "Usage:"
          echo "  antigravity-credit-resumer install   Install or update extension into IDE"
          echo "  antigravity-credit-resumer path      Print path to packaged .vsix"
          echo "  antigravity-credit-resumer version   Print version"
          ;;
      esac
    EOS
    chmod 0755, bin/"antigravity-credit-resumer"
  end

  def post_install
    if which("antigravity-ide")
      begin
        system "antigravity-ide", "--install-extension", "#{opt_pkgshare}/antigravity-credit-resumer-#{version}.vsix", "--force"
      rescue
        nil
      end
    end
    if which("code")
      begin
        system "code", "--install-extension", "#{opt_pkgshare}/antigravity-credit-resumer-#{version}.vsix", "--force"
      rescue
        nil
      end
    end
  end

  test do
    assert_match "antigravity-credit-resumer v#{version}", shell_output("#{bin}/antigravity-credit-resumer version")
    assert_path_exists pkgshare/"antigravity-credit-resumer-#{version}.vsix"
  end
end
