## Context

See `proposal.md` for motivation.
Currently, `simple_coon_check` houses `Formula/split-tunnel-monitor.rb` and `secure_secrets` houses `Formula/sec-agent.rb`. Homebrew users must tap both source repos independently. We are establishing `homebrew-tap` (workspace: `brew_tab`) as the single source of truth for formulas.

## Goals / Non-Goals

**Goals:**
- Provide a clean, standalone repository `homebrew-tap` containing `Formula/split-tunnel-monitor.rb` and `Formula/sec-agent.rb`.
- Implement deprecation notices in `simple_coon_check` and `secure_secrets` formulas to guide existing users to `iafilius/tap`.
- Define an automated cross-repo formula update workflow for GitHub Actions / release scripts.

**Non-Goals:**
- Removing legacy formulas immediately (must go through a deprecation grace period first).
- Building custom binary hosting (all release tarballs remain hosted in GitHub Releases of `simple_coon_check` and `secure_secrets`).

## Decisions

### Decision 1: Naming the Central Repository `homebrew-tap`
- **Choice**: Rename/Host the GitHub repository as `homebrew-tap`.
- **Rationale**: Homebrew CLI converts `brew tap iafilius/tap` to `https://github.com/iafilius/homebrew-tap`.
- **Alternative**: Naming it `homebrew-tools` would require `brew tap iafilius/tools`. `homebrew-tap` is the canonical standard.

### Decision 2: Dual Formula Maintenance with `opoo` Deprecation Warning
- **Choice**: Keep `Formula/*.rb` in source repositories temporarily, adding a Homebrew deprecation warning `opoo`.
- **Rationale**: Prevents breaking existing users who ran `brew tap iafilius/simple_coon_check`.
- **Alternative**: Deleting source repo formulas immediately, which would break existing installations on `brew update`.

### Decision 3: Cross-Repo Release Sync via GitHub Action / Repository Dispatch
- **Choice**: Source repositories trigger formula updates in `homebrew-tap` using a GitHub Action with a `TAP_GITHUB_TOKEN` (or Personal Access Token with repo write scope).
- **Rationale**: Keeps formula version and SHA256 in sync with source releases automatically.

## Risks / Trade-offs

- **[Risk]**: Token permissions for cross-repo push in GitHub Actions.
  - **Mitigation**: Use a dedicated GitHub Secret (`TAP_GITHUB_TOKEN`) with minimal repo write access to `iafilius/homebrew-tap`.

- **[Risk]**: Formula drift between source repos and central tap.
  - **Mitigation**: Source repo release workflows update both local legacy formula and central tap formula in a single automated step.

## Migration Plan

1. **Step 1**: Rename GitHub repo to `homebrew-tap` and push `Formula/split-tunnel-monitor.rb` and `Formula/sec-agent.rb` to `brew_tab`.
2. **Step 2**: Add deprecation notice (`opoo`) to `simple_coon_check/Formula/split-tunnel-monitor.rb` and `secure_secrets/Formula/sec-agent.rb`.
3. **Step 3**: Configure release sync workflow in `simple_coon_check` and `secure_secrets`.
4. **Step 4**: Update READMEs across all repositories.
