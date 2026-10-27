# EmergeShift Homebrew Tap

Homebrew formulas for [MixumART](https://github.com/EmergeShift/MixumART) host-side tools.

## Installation

### mixum CLI

```bash
brew install EmergeShift/tap/mixum
```

This builds `mixum` and `mixum-artd` from source. Requires Rust (installed automatically as a build dependency).

### MixumART Desktop App

The desktop app cask is not yet available. It will be added once signed and notarized DMG builds are published. Until then, build from source or use the pre-release binaries.

## Updating

```bash
brew update
brew upgrade mixum
```

## Uninstallation

```bash
brew uninstall mixum
```

## Prerequisites

- **macOS** (Apple Silicon or Intel)
- **Rust** (installed automatically by Homebrew as a build dependency)
- **Apple Container** (for the default runtime backend): `brew install container`

## What's included

- `mixum` — CLI for environment control, snapshots, and MCP server
- `mixum-artd` — Unix socket daemon for agent-facing operations

## Troubleshooting

### Build fails with "linker not found"

Ensure Xcode Command Line Tools are installed:

```bash
xcode-select --install
```

### "cargo: command not found" during build

Homebrew should install Rust automatically. If not:

```bash
brew install rust
```

### Formula is outdated

```bash
brew update
brew upgrade mixum
```

## For maintainers

### Updating the formula

1. Create a new GitHub release with tag `vX.Y.Z`
2. Compute SHA256 of the source tarball:

```bash
curl -sL https://github.com/EmergeShift/MixumART/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
```

3. Update `Formula/mixum.rb`:
   - Change `url` to the new tag
   - Update `sha256` with the computed value

4. Commit and push:

```bash
git add Formula/mixum.rb
git commit -m "mixum X.Y.Z"
git push
```

Users can then `brew update && brew upgrade mixum`.

### Automated updates (future)

Consider adding a GitHub Actions workflow to automate SHA256 computation and formula updates on release.

## License

Apache-2.0
