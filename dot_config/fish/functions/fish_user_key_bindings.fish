function fish_user_key_bindings
    bind \cc __cancel_with_newline
end

function __cancel_with_newline
    # 先换行，让当前输入内容留在屏幕上
    echo

    # 清空当前 commandline，但不回删上一行显示
    commandline ''

    # 重画 prompt
    commandline -f repaint
end
