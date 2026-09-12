# Encrypted Secrets and Ghostty Migration Design

## Goal

Extend the existing chezmoi-managed macOS environment so a fresh Sonoma installation can restore Ghostty and selected credential-bearing service configurations without committing plaintext secrets to the public dotfiles repository.

## Scope

### Plaintext managed configuration

- Ghostty configuration from `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty`.
- Existing shell, Fish, Git, LinearMouse, and LaunchAgent configuration remains managed as it is today.

Ghostty's preferences plist, saved application state, window position, and other generated state are excluded. They are machine-local UI state rather than durable configuration.

### Encrypted managed configuration

- `~/.config/rclone/rclone.conf`
- `~/.local/state/alist/config.json`
- The live Mihomo configuration currently located at `/opt/homebrew/etc/mihomo/config.yaml`

Only these files are in scope. Rclone cache, Alist databases and sessions, Mihomo caches, downloaded rule databases, UI assets, and logs remain excluded.

### Explicit exclusions

- SSH private keys
- GitHub CLI, Codex, browser, and application login sessions
- macOS Keychain data
- Shell and Fish history
- Neovim configuration and runtime state
- Docker credential state
- Project-local `.env` files and credentials
- Caches, logs, databases, and generated runtime state

`bob` remains in the Brewfile even though Neovim configuration is not managed by this repository.

## Package Management

The Brewfile will add:

- Formulae: `age`, `rclone`
- Casks: `ghostty`, `font-agave-nerd-font`

The Agave Nerd Font cask satisfies the font referenced by the current Ghostty configuration. Homebrew remains responsible for installing applications and command-line tools; chezmoi remains responsible for configuration.

## Encryption Design

Chezmoi's age integration will encrypt complete files rather than interpolating individual secret fields into templates. This reduces the chance of overlooking a token or password when a tool changes its config schema.

The repository will contain:

- Age-encrypted versions of the three in-scope secret files.
- The public age recipient in chezmoi configuration.
- A passphrase-encrypted age identity used for first-run recovery.
- A before-apply bootstrap script that decrypts the identity to `~/.config/chezmoi/key.txt` with mode `0600` when it is not already present.

The repository will never contain the plaintext age identity or the age passphrase. Because the encrypted identity and encrypted configuration files are stored together, the passphrase must be strong, unique, and retained outside the repository.

Rclone's `obscure` values are treated as secrets. Obscuring is not used as the repository security boundary.

## Target Paths and Restore Flow

### Home-directory files

Rclone and Alist will be represented as encrypted chezmoi-managed target files. During `chezmoi apply`, they will be decrypted directly to their normal paths and assigned mode `0600`.

Ghostty will be restored as a normal plaintext managed file to:

`~/Library/Application Support/com.mitchellh.ghostty/config.ghostty`

### Mihomo

Chezmoi normally targets the user's home directory, while Mihomo's live configuration belongs under `/opt/homebrew`. Its encrypted file will therefore be kept as restore material in the repository. A dedicated helper will:

1. Require Homebrew's Mihomo installation to exist.
2. Decrypt the file without printing its contents.
3. Install it at `/opt/homebrew/etc/mihomo/config.yaml` with mode `0600`.
4. Avoid copying Mihomo cache, database, or UI directories.

The helper will fail without modifying the destination if the age identity is unavailable or decryption fails.

### First Sonoma bootstrap

The bootstrap flow will be:

1. Install Homebrew in the default Apple Silicon prefix.
2. Run `brew bundle` so age, rclone, Ghostty, the font, and the existing environment are installed.
3. Initialize chezmoi from the already-copied local source repository.
4. Prompt once for the age identity passphrase if the decrypted identity does not exist.
5. Apply home-directory configuration.
6. Run the explicit Mihomo restore helper after Homebrew and age are available.

Before overwriting any existing target credential file, the implementation will show a diff status or create a permission-restricted backup. No secret value will be printed in logs or terminal output.

## Existing Sanitized Material

The existing sanitized Alist and proxy templates remain as documented fallback examples. The encrypted files are the exact private restore source; sanitized templates remain safe references and do not override successfully decrypted files.

Documentation will clearly distinguish the encrypted restore path from the sanitized fallback path to prevent accidentally applying placeholders over working credentials.

## Failure Handling

- Missing Homebrew or packages: stop with the exact prerequisite command.
- Missing age identity: stop before applying encrypted files and explain how to restore the identity.
- Wrong passphrase or failed decryption: leave destination files unchanged.
- Existing destination file: preserve it until encrypted input has decrypted and validated successfully.
- Missing old-volume source during initial import: report the unresolved source path and do not create an empty encrypted file.
- Git secret scan failure: block commit and identify only the file and field location, never the secret value.

## Verification

Implementation is complete only when all of the following pass:

1. Brewfile syntax is accepted and contains `age`, `rclone`, `ghostty`, `font-agave-nerd-font`, and retained `bob`.
2. Ghostty's managed file matches the current configuration byte-for-byte.
3. Each encrypted file decrypts to the same SHA-256 digest as its source without displaying plaintext.
4. Restored rclone and Alist files have mode `0600`; restored Mihomo config has mode `0600`.
5. Rclone can parse the restored config without exposing values.
6. Ghostty can validate or load its restored configuration.
7. Chezmoi dry-run/diff shows only intended targets.
8. Repository worktree and Git history scans find no plaintext credential patterns or private keys.
9. Neovim configuration, SSH private keys, histories, caches, databases, and session files remain absent from the managed source.
10. The Sonoma repository copy is updated to the same commit and passes a content comparison with the source repository.

## Delivery

Implementation changes will be committed locally. A GitHub push requires a newly authenticated `gh` or Git credential; the previously exposed history token will not be reused. After verification, the committed repository will also be copied to the Sonoma volume so bootstrap does not depend on the remote being current.
