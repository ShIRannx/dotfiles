function! s:isS6Overlay()
  let filepath = expand("%:p")

  " Check for s6-overlay/s6-rc.d/**/run files
  if filepath =~# '\v/s6-overlay/s6-rc.d/.*/run$' | return 1 | en

  let shebang = getline(1)
  if shebang =~# '^#!.*/command/with-contenv\s\+/usr/bin/bash\>' | return 1 | en


  return 0
endfunction

augroup s6_vim_ftbash_s6overlay
    au!
    au BufNewFile,BufRead * if s:isS6Overlay() | set ft=bash | en
augroup END
