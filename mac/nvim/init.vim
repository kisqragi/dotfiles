"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/nvim/dein')
  let g:dein#cache_dicrectory = '$HOME/.cache/dein'

  call dein#begin('$HOME/.cache/dein')

  let s:toml_dir  = '$HOME/.config/nvim/dein/toml'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy' : 0})
"  call dein#load_toml(s:lazy_toml, {'lazy' : 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" indent----------------------------------
set tabstop=2
set shiftwidth=2
set expandtab
" ----------------------------------------

" search----------------------------------
set ignorecase
set smartcase
" ----------------------------------------

" highlight off---------------------------
nmap <Esc><Esc> :nohl<CR>
" ----------------------------------------

" Persistence of undo---------------------
if has('persistent_undo')
  let undo_path = expand('~/.config/nvim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif
" ----------------------------------------

" terminal settings-----------------------
command! -nargs=* T  split | wincmd j | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
autocmd TermOpen * startinsert
" Exit terminal's insert mode with Esc.---
tnoremap <Esc> <C-\><C-n>
" ----------------------------------------
