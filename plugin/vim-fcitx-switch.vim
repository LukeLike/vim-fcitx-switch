" vim-fcitx-switch. Switch fcitx to english ime when entering normal mode.
" Maintainer: Luke <luke_13@sjtu.edu.cn>
" Licence: DWTFYWTPL

if exists('g:loaded_vim_fcitx_switch') && g:loaded_vim_fcitx_switch
  finish
endif

let g:loaded_vim_fcitx_switch = 1


let g:insert_ime_mode=0

function! CloseIME()
  let g:insert_ime_mode = system('fcitx-remote')
  if g:insert_ime_mode != 0
    call system('fcitx-remote -c')
  endif
endfunction

function! RestoreIME()
  if g:insert_ime_mode == 2
    call system('fcitx-remote -o')
  endif
endfunction

if has('unix')
    autocmd! InsertLeave * :call CloseIME()
    autocmd! InsertEnter * :call RestoreIME()
endif


