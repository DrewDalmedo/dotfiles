set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" writing
Plugin 'junegunn/goyo.vim'

" Code Autocompletion
Plugin 'ycm-core/YouCompleteMe'

" C++ Syntax
Plugin 'bfrg/vim-cpp-modern'

" colorscheme
Plugin 'tomasr/molokai'
Plugin 'markvincze/panda-vim'

call vundle#end()


filetype plugin indent on

" C++ Syntax Highlighting Settings
" attributes (c++11)
let g:cpp_attributes_highlight = 1
" struct / class member variables
let g:cpp_member_highlight = 1

" goyo
autocmd! User GoyoEnter set number

" auto compilation commands
autocmd! BufWritePost *.tex exec '!pdflatex %' | exec '!biber %:r' | exec '!pdflatex %' | execute ':redraw!'

" colorscheme
colorscheme molokai

syntax on
set number
set relativenumber

set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

set hlsearch
set ignorecase
set incsearch
set smartcase

set lazyredraw

set linebreak
set wrap

set laststatus=2
set ruler
set cursorline
set noerrorbells
set title

