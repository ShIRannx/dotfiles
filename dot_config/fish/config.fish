# ~/.config/fish/config.fish

# Homebrew env should be loaded early
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

# bob.nvim
fish_add_path ~/.local/share/bob/nvim-bin

# local bin
fish_add_path --prepend ~/.local/bin

# libpq
fish_add_path --prepend /opt/homebrew/opt/libpq/bin

# uv index
set -gx UV_DEFAULT_INDEX "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple"

# proxy
set -gx https_proxy http://127.0.0.1:7890
set -gx http_proxy http://127.0.0.1:7890
set -gx all_proxy socks5://127.0.0.1:7890
set -gx NO_PROXY "localhost,127.0.0.1,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"

# Only run interactive setup in interactive shells
if status is-interactive
    alias vim='nvim'

    # zoxide
    if type -q zoxide
        zoxide init fish --cmd cd | source
    end

    # k3d completion
    if type -q k3d
        k3d completion fish | source
    end

    # Node version manager
    if type -q fnm
        fnm env --use-on-cd | source
    end

    # fish_git_prompt style
    set -g __fish_git_prompt_color_prefix normal
    set -g __fish_git_prompt_color_suffix normal

    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_char_dirtystate "✗"
    set -g __fish_git_prompt_char_stateseparator " "

    set -g __fish_git_prompt_color_branch --bold green
    set -g __fish_git_prompt_color_dirtystate yellow
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
#source ~/.orbstack/shell/init2.fish 2>/dev/null || :
