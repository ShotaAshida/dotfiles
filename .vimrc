if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/neomru.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'aereal/vim-colors-japanesque'
Plug 'felipesousa/rupza'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-rails'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()

let mapleader = "\<Space>"

"Git
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
nmap ]c         <Plug>(GitGutterNextHunk)
nmap [c         <Plug>(GitGutterPrevHunk)
omap ic         <Plug>(GitGutterTextObjectInnerPending)
omap ac         <Plug>(GitGutterTextObjectOuterPending)
xmap ic         <Plug>(GitGutterTextObjectInnerVisual)
xmap ac         <Plug>(GitGutterTextObjectOuterVisual)

"vim-fugtive
nnoremap <leader>gs :tab sp<CR>:Gstatus<CR>:only<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gh :tab sp<CR>:0Glog<CR>
" abbrev for `git history`: create new quickfix tab for history
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gr :Grebase -i<CR>
nnoremap <leader>gg :Ggrep 
nnoremap <leader>gm :Gmerge 


set nobackup
set noswapfile
set autoread
set hidden
set showcmd

" 見た目系"
set number
syntax on 
colorscheme rupza
set cursorline
set t_Co=256
hi CursorLine term=reverse cterm=none ctermbg=242

" 行末の1文字先までカーソルを移動できるように"
set virtualedit=onemore
" インデントはスマートインデント"
set smartindent
" 括弧入力時の対応する括弧を表示"
set showmatch
source $VIMRUNTIME/macros/matchit.vim
" ステータスラインを常に表示"
set laststatus=2
" コマンドラインの補完"
set wildmode=full
" 折り返し時に表示行単位での移動できるようにする"
nnoremap j gj
nnoremap k gk


"Tab系"
"不可視文字を可視化(タブが「▸-」と表示される)"
set list listchars=tab:\▸\-
set expandtab
set tabstop=4
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

nnoremap <silent><C-e> :NERDTreeToggle<CR>
set clipboard+=unnamed

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

nnoremap <C-g> :Ag<CR>

nnoremap <C-p> :FZFFileList<CR>
command! FZFFileList call fzf#run(fzf#wrap({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'down': '40%'}))

let g:deoplete#enable_at_startup = 1
set encoding=utf-8
set pyxversion=3

set updatetime=100

