" Remap Arrows Just Over SSH
if $SSH_CLIENT != '' || $SSH_TTY  != ''
  set t_ku=[A
  set t_kd=[B
  set t_kr=[C
  set t_kl=[D
endif

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
