call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

set nocompatible

" SPACE is the leader
nnoremap <SPACE> <nop>
let mapleader=" "

" Make backspace work
set backspace=indent,eol,start

" Indent
filetype on
filetype plugin on
filetype indent on

" Syntax highlighting
syntax on

" Set hidden
set hidden

" Current mode
set showmode

" Line numbers
set nu
set relativenumber

" Clipboard
set clipboard=unnamedplus

nnoremap <C-N> :set nonumber! norelativenumber!<CR>

" Indent w/ tabs
set expandtab
set tabstop=2
set shiftwidth=2

" Keep padding
set scrolloff=5

" Move between buffers
map <leader>l :bnext<CR>
map <leader>h :bprev<CR>

" Quick jump
map <leader>b :Buffers<CR>
map <leader>p :Files<CR>

" Close buffer
map <leader>w :bd<CR>

" No error bells
set noerrorbells
set vb t_vb=
