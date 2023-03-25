" Plug stuff https://github.com/junegunn/vim-plug

" Get VimPlug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Quramy/tsuquyomi'
Plug 'rust-lang/rust.vim'

call plug#end()

set number        				          " show line numbers

set showcmd				                  " show last command in bottom right

set cursorline				              " highlight current line

filetype indent on			            " load filetype-specific indent file from ~/.vim/indent/<lang>.vim

set showmatch 				              " highlight matching of {}[]()

set incsearch 				              " search as achars are entered

set hlsearch 				                " highlight matches


" colorscheme codedark 			          " Set dark color scheme from https://github.com/tomasiser/vim-code-dark#installation
colorscheme dracula

let g:airline_theme = 'dracula'

syntax on

"-- FOLDING --
set foldmethod=syntax 			        " syntax highlighting items specify folds
set foldcolumn=1 			              " defines 1 col at window left, to indicate folding
let javaScript_fold=1 			        " activate folding by JS syntax
set foldlevelstart=99 			        " start file with all folds opened

set tabstop=2
set expandtab
set smarttab
set shiftwidth=0
set noswapfile                      " Don't use swapfile

" Line numbering is relative taken from here https://jeffkreeftmeijer.com/vim-number/
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


