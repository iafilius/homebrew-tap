class AntigravityCreditResumer < Formula
  desc "Auto-resumes Antigravity AI Cascades on credit refill and manages model switching"
  homepage "https://github.com/iafilius/antigravity-credit-resumer"
  url "https://github.com/iafilius/antigravity-credit-resumer/releases/download/v0.5.0/antigravity-credit-resumer-0.5.0.vsix"
  version "0.5.0"
  sha256 "a45b1dedfa14d0978254f40b6f049bf77f31e10893e625ee4d28984b6a96c019"
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
      system "antigravity-ide", "--install-extension", "#{opt_pkgshare}/antigravity-credit-resumer-#{version}.vsix", "--force" rescue nil
    end
    if which("code")
      system "code", "--install-extension", "#{opt_pkgshare}/antigravity-credit-resumer-#{version}.vsix", "--force" rescue nil
    end
  end

  test do
    assert_match "antigravity-credit-resumer v#{version}", shell_output("#{bin}/antigravity-credit-resumer version")
    assert_predicate pkgshare/"antigravity-credit-resumer-#{version}.vsix", :exist?
  end
end
