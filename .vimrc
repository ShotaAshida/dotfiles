if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'aereal/vim-colors-japanesque'
call plug#end()

set fenc=utf-8
"バックアップを作らない"
set nobackup
" スワップファイルを作らない"
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す"
set autoread
" バッファが編集中でもその他のファイルを開けるように"
set hidden
" 入力中のコマンドをステータスに表示する"
set showcmd

"clipboard share"

" 見た目系"
" 行番号を表示"
set number

"強調"
set cursorline

" 行末の1文字先までカーソルを移動できるように"
set virtualedit=onemore
" インデントはスマートインデント"
set smartindent
" 括弧入力時の対応する括弧を表示"
set showmatch
" ステータスラインを常に表示"
set laststatus=2
" コマンドラインの補完"
set wildmode=full
" 折り返し時に表示行単位での移動できるようにする"
nnoremap j gj
nnoremap k gk

"補完"
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>

"Tab系"
"不可視文字を可視化(タブが「▸-」と表示される)"
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする"
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）"
set tabstop=4
" 行頭でのTab文字の表示幅"
set shiftwidth=4

" 検索系"
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する"
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する"
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる"
set incsearch
" 検索時に最後まで行ったら最初に戻る"
set wrapscan
" 検索語をハイライト表示"
set hlsearch

syntax on 
let g:japanesque_use_iTerm_colors = 1
colorscheme japanesque
set t_Co=256

nnoremap <silent><C-e> :NERDTreeToggle<CR>
set clipboard+=unnamed
