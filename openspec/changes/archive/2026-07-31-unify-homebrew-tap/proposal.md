## Why

Currently, Homebrew packages (`split-tunnel-monitor` and `sec-agent`) are hosted in fragmented, per-project repositories (`simple_coon_check` and `secure_secrets`). End-users must issue a separate `brew tap` command for each project and download full git repositories. Consolidating all formulas into a single `homebrew-tap` repository allows users to issue `brew tap iafilius/tap` once and seamlessly install any software published by `iafilius`, while establishing an automated sync pipeline from source repositories.

## What Changes

- **Centralized Tap Repository**: Create `homebrew-tap` (represented by `brew_tab`) hosting canonical Ruby formulas (`Formula/split-tunnel-monitor.rb` and `Formula/sec-agent.rb`).
- **Single-Command Tap UX**: Enable users to run `brew tap iafilius/tap` and `brew install <tool>`.
- **Source Repository Sync Pipeline**: Establish an automated release workflow (GitHub Action / script) in source repositories (`simple_coon_check` and `secure_secrets`) to update formula versions and SHA-256 hashes in `homebrew-tap` on release.
- **Backwards Compatibility**: Maintain legacy `Formula/*.rb` in source repositories with Homebrew deprecation notices (`opoo`) instructing users to switch to `iafilius/tap`.

## Capabilities

### New Capabilities
- `central-homebrew-tap`: Manages unified formula distribution, validation, repository layout, and cross-repo release sync contracts for `iafilius` Homebrew packages.

### Modified Capabilities
*(None - initial setup of central tap)*

## Impact

- **Repos**: `brew_tab` (central tap), `simple_coon_check`, `secure_secrets`.
- **User Installation Workflow**: Upgrades `brew tap` experience to standard `iafilius/tap`.
- **CI/CD**: Adds token-based cross-repository release dispatch / formula sync workflows in source repositories.
