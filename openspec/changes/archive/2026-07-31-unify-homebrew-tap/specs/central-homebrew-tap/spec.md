## Purpose

Provides a centralized Homebrew tap repository (`homebrew-tap`) to host and distribute all software formulas created by `iafilius` under a single tap namespace.

## ADDED Requirements

### Requirement: Centralized Tap Repository Structure
The repository MUST structure all software formulas inside a top-level `Formula/` directory and comply with standard Homebrew naming conventions (`homebrew-tap`).

#### Scenario: User taps centralized repository
- **WHEN** end-user executes `brew tap iafilius/tap`
- **THEN** Homebrew successfully clones the `homebrew-tap` repository and indexes all formulas in `Formula/`.

### Requirement: Single-Command Formula Installation
The system MUST allow end-users to install any published tool (`split-tunnel-monitor`, `sec-agent`) directly after adding `iafilius/tap`.

#### Scenario: User installs formula from central tap
- **WHEN** end-user executes `brew install split-tunnel-monitor` or `brew install sec-agent` after tapping `iafilius/tap`
- **THEN** Homebrew installs the binary or script without requiring additional tap paths.

### Requirement: Backwards-Compatible Deprecation Notice in Legacy Taps
Source repositories (`simple_coon_check` and `secure_secrets`) MUST retain legacy formula files displaying a Homebrew warning message directing users to migrate to `iafilius/tap`.

#### Scenario: Legacy user installs from project repo tap
- **WHEN** user executes `brew install iafilius/simple_coon_check/split-tunnel-monitor`
- **THEN** Homebrew displays a deprecation notice (`opoo`) advising migration to `brew tap iafilius/tap` before completing installation.

### Requirement: Source Repository Release Synchronization
Source repositories MUST publish updated release versions and SHA-256 hashes to the `homebrew-tap` repository upon release tag creation.

#### Scenario: Release tag created in source repository
- **WHEN** a maintainer pushes a new release tag `vX.Y.Z` in `simple_coon_check` or `secure_secrets`
- **THEN** the automated release workflow updates the corresponding formula in `homebrew-tap`.
