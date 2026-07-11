# dotfiles

chezmoi-managed macOS development environment for zsh, fish, Neovim, Git, LinearMouse, and Homebrew packages.

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
- `dot_config/nvim`
- `dot_config/linearmouse`
- `Brewfile`

## Not Included

- shell history and zsh sessions
- SSH private keys and known hosts
- GitHub CLI auth tokens
- Clash/Mihomo subscription files, caches, and proxy profiles

History review showed heavy use of Homebrew, Docker/OrbStack, zsh, Neovim, uv, GitHub CLI, k3d, zoxide, nvm/fnm, yazi, ansible, and proxy tooling, so the Brewfile keeps those current installed tools as the reproducible base.
