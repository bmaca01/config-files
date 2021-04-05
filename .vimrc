let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'

" Plug 'ervandew/supertab'
" Plug 'raimondi/delimitmate'

Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/lh-style'
Plug 'LucHermitte/lh-tags'
Plug 'LucHermitte/lh-dev'
Plug 'LucHermitte/lh-brackets'
Plug 'LucHermitte/searchInRuntime'
Plug 'LucHermitte/mu-template'
Plug 'tomtom/stakeholders_vim'
Plug 'LucHermitte/alternate-lite'
Plug 'LucHermitte/lh-cpp'
call plug#end()

filetype plugin indent on
set nocompatible

syntax on
set number
set relativenumber
set ruler
set nobackup

set expandtab
set nojoinspaces
set shiftwidth=4
set tabstop=4
set textwidth=80

noremap n nzz
noremap N Nzz

" press <F4> to fix indentation in whole file; overwrites marker
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzz

" autocmd BufReadPost *.odt :%!odt2txt %
set mouse=a

" set local leader
let maplocalleader="\\"

" NERDTree stuff
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror


"""" lh-vim shit
let g:mt_IDontWantTemplatesAutomaticallyInserted = 1

" enable alt key
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
