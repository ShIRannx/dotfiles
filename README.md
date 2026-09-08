# dotfiles

chezmoi-managed macOS development environment for zsh, fish, Git, LinearMouse, and Homebrew packages. Neovim itself can still be installed and versioned with Homebrew and bob, but its configuration is intentionally managed separately.

## Restore

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
chezmoi init ShIRannx/dotfiles
chezmoi apply
brew bundle --file ~/.local/share/chezmoi/Brewfile
```

On this machine, `brew install chezmoi` currently fails because `/opt/homebrew` is not writable by the current user. Fix ownership first:

```sh
sudo chown -R "$USER" /opt/homebrew
chmod -R u+w /opt/homebrew
```

Then run:

```sh
~/.local/share/chezmoi/scripts/bootstrap.sh
```

## Included

- `dot_zshrc.tmpl`, `dot_zprofile.tmpl`, `dot_zshenv.tmpl`
- `dot_gitconfig`
- `dot_config/fish`
- `dot_config/linearmouse`
- `Brewfile`
- `dot_Library/LaunchAgents/com.alistgo.alist.plist.tmpl`
- `dot_Library/LaunchAgents/homebrew.mxcl.mihomo.plist.tmpl`
- `dot_Library/LaunchAgents/com.sagernet.sing-box.plist.tmpl`
- `services/alist/config.json.tmpl` with `jwt_secret` redacted as a chezmoi template value
- `proxy/sing-box/config.json` as a sanitized base config; intentionally excludes `config.d`
- `proxy/mihomo/config.yaml.tmpl` with the subscription URL redacted as a chezmoi template value

## Not Included

- shell history and zsh sessions
- SSH private keys and known hosts
- GitHub CLI auth tokens
- Neovim configuration
- Clash/Mihomo subscription files, caches, downloaded rule/database files, and proxy profiles
- sing-box `config.d` node/profile files
- Alist database, sessions, storage credentials, shares, logs, and temp files

## Alist

The LaunchAgent is managed by chezmoi. The Alist runtime config is kept under `services/` as restore material and is ignored by chezmoi apply by default because the live data directory also contains the SQLite database.

To restore the sanitized config on a new Mac after placing the Alist binary at `~/.local/bin/alist`:

```sh
install -d ~/.local/state/alist
chezmoi execute-template < ~/.local/share/chezmoi/services/alist/config.json.tmpl > ~/.local/state/alist/config.json
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.alistgo.alist.plist
launchctl enable gui/$(id -u)/com.alistgo.alist
```

Set a real JWT secret in chezmoi data before rendering, or replace the placeholder manually on the target machine.

## Proxy Configs

The proxy configs are kept under `proxy/` as restore material and are ignored by chezmoi apply by default.

To restore them on a new Mac after Homebrew packages are installed:

```sh
install -d /opt/homebrew/etc/sing-box /opt/homebrew/etc/mihomo
cp ~/.local/share/chezmoi/proxy/sing-box/config.json /opt/homebrew/etc/sing-box/config.json
chezmoi execute-template < ~/.local/share/chezmoi/proxy/mihomo/config.yaml.tmpl > /opt/homebrew/etc/mihomo/config.yaml
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/homebrew.mxcl.mihomo.plist
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.sagernet.sing-box.plist
```

Set the real Mihomo subscription URL in chezmoi data before rendering, or replace the placeholder manually on the target machine.

History review showed heavy use of Homebrew, Docker/OrbStack, zsh, Neovim, uv, GitHub CLI, k3d, zoxide, nvm/fnm, yazi, ansible, and proxy tooling, so the Brewfile keeps those current installed tools as the reproducible base.
