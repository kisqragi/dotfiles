"-----------------------------------
" 表示
"-----------------------------------

" カラースキーム
colorscheme molokai

" シンタックスハイライト
syntax on

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
set expandtab

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

" スクロールをファイル内のみに設定
set mouse=a

" 文字がなくても移動できる設定
set virtualedit=all

" 自動インデント
set smartindent

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
set smartcase

" インクリメンタルサーチ(1文字入力毎に検索)
set incsearch

" 検索結果をハイライト
set hlsearch
 



"-----------------------------------
" その他
"-----------------------------------

" コマンドラインの履歴件数
set history=10000

" 文字コードをUTF-8に設定
set fenc=utf-8

" undoの永続化
if has('persistent_undo')
	let undo_path = expand('~/.vim/undo')
    " ディレクトリが存在しない場合は作成
    if !isdirectory(undo_path)
        call mkdir(undo_path, 'p')
    endif
	exe 'set undodir=' .. undo_path
	set undofile
endif
