"-----------------------------------
" dein.vim設定
"-----------------------------------

" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " .toml file
    let s:rc_dir = expand('~/.config/nvim')
    if !isdirectory(s:rc_dir)
        call mkdir(s:rc_dir, 'p')
    endif
    let s:toml = s:rc_dir . '/dein.toml'

    " read toml and cache
    call dein#load_toml(s:toml, {'lazy': 0})
    
    " add colorscheme
    call dein#add('morhetz/gruvbox')

    " end settings
    call dein#end()
    call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
    call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif
" }}}




"-----------------------------------
" 表示
"-----------------------------------

" カラースキーム
set background=dark
colorscheme gruvbox

" Esc２回でハイライトを消す
nmap <Esc><Esc> :nohl<CR>

"-----------------------------------------------------------
" 行末の空白とタブ(^I)を表示する
" set list
" set listchars=trail:·
" highlight ExtraWhitespace ctermfg=darkgreen guifg=darkgreen
" match ExtraWhitespace /\s\+$/
" "-----------------------------------------------------------

" tabキーでのインデント時半角スペースを挿入 
" Makefileの場合スペースではなくtabを挿入
let _curfile=expand("%:r")
if _curfile == 'Makefile' || _curfile == 'makefile'
	set noexpandtab
else
	set expandtab
endif

" インデント種類
set smartindent

" インデント幅
set shiftwidth=4

" tabキー押下時の文字幅
set softtabstop=4

" tab文字の表示幅
set tabstop=4

" 対応する括弧を強調
set showmatch

" 行番号表示
set number

" 相対行を表示
set relativenumber


" スクロールをファイル内のみに設定
set mouse=a

" 文字がなくても移動できる設定
"set virtualedit=all

" ファイル名を常時表示
set laststatus=2

" カーソルが何列何行目か表示する
set ruler

" コマンドライン補完
set wildmenu




"-----------------------------------
" 検索
"-----------------------------------

" 小文字で検索するときだけ大小を無視する
set ignorecase

" インクリメンタルサーチ(1文字入力毎に検索)
set incsearch




"-----------------------------------
" その他
"-----------------------------------

" コマンドラインの履歴件数
set history=10000

" 文字コードをUTF-8に設定
set fenc=utf-8

" 保存時にsudo権限で無理やり保存
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" undoの永続化
set undofile

" 前回開いたカーソル位置から再開
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" カーソルを末尾から次の行の先頭
" 行の先頭から前の末尾へ移動できるようにする
set whichwrap=b,s,h,l,<,>,[,],~

" メッセージを英語化
language C

"-----------------------------------
" NERDTreeの設定
"-----------------------------------

" NERDTreeをvim起動時に実行(ファイル指定無しの場合)
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim終了時NERDTreeも終了する
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden = 1
                  



"-----------------------------------
" gitgutterの設定
"-----------------------------------
                  
set signcolumn=yes

                  


"-----------------------------------
" preview_markdownの設定
"-----------------------------------
                  
" 垂直分割
let g:preview_markdown_vertical = 1

" ファイル保存時、表示を自動修正
let g:preview_markdown_auto_update = 1

" 新規ターミナルを右側に表示
set splitright

set updatetime=300

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')

" [markonm/traces.vim]を利用するために無効
set inccommand=nosplit
