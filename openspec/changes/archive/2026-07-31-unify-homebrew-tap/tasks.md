## 1. Central Tap Setup (`brew_tab` / `homebrew-tap`)

- [x] 1.1 Create `Formula/` directory in `brew_tab`.
- [x] 1.2 Import `split-tunnel-monitor.rb` from `simple_coon_check` into `Formula/split-tunnel-monitor.rb`.
- [x] 1.3 Import `sec-agent.rb` from `secure_secrets` into `Formula/sec-agent.rb`.
- [x] 1.4 Create README.md documenting `brew tap iafilius/tap` and available formulas.
- [x] 1.5 Validate formulas locally using `brew audit --strict Formula/*.rb`.

## 2. Legacy Tap Deprecation in Source Repositories

- [x] 2.1 Add Homebrew deprecation notice (`opoo`) in `simple_coon_check/Formula/split-tunnel-monitor.rb`.
- [x] 2.2 Add Homebrew deprecation notice (`opoo`) in `secure_secrets/Formula/sec-agent.rb`.
- [x] 2.3 Update installation instructions in `simple_coon_check/README.md` to point to `iafilius/tap`.
- [x] 2.4 Update installation instructions in `secure_secrets/README.md` to point to `iafilius/tap`.

## 3. Automated Formula Release Dispatch Pipeline

- [x] 3.1 Create GitHub Action `.github/workflows/publish-formula.yml` in `simple_coon_check` to update central tap on release.
- [x] 3.2 Create GitHub Action `.github/workflows/publish-formula.yml` in `secure_secrets` to update central tap on release.
- [x] 3.3 Test release tag formula sync across repos.
