function fish_prompt
    set -l last_status $status

    # user@host
    echo -n "["
    set_color normal
    echo -n (whoami)
    echo -n "@"
    set_color brred
    echo -n (hostname -s)
    set_color normal

    # cwd
    set_color cyan
    if test "$PWD" = "$HOME"
        echo -n " ~"
    else
        echo -n " $(basename "$PWD")"
    end
    set_color brblack

    # git prompt
    set -l git_prompt (fish_git_prompt)
    if test -n "$git_prompt"
        echo -n "$git_prompt"
    else
        echo -n " "
    end

    set_color normal
    echo -n "]"
    echo -n '$ '
end
