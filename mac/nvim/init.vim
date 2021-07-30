" indent
set tabstop=2
set shiftwidth=2
set expandtab
" search
set ignorecase
set smartcase
" undo
if has('persistent_undo')
  let undo_path = expand('~/.config/nvim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif
