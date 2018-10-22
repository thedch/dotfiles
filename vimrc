set nocompatible " be iMproved, required
filetype off " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
set updatetime=100 " Make git gutter update close to real time

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
colorscheme desert

set tabstop=4 " The width of a tab is set to 4.
set shiftwidth=4 " Indents will have a width of 4
set softtabstop=4 " Sets the number of columns for a tab
set expandtab " Expand tabs to spaces

set number relativenumber " Enable Line Numbers
set autoindent " Stays on current indent when no file-specific matching
set showmatch " Highlight matching [{()}]

set background=dark

nnoremap <Tab> :tabnext<CR> " Pressing tab will cycle through open tabs

" Search down into sub folders
" Provides tab-completion for all file-related tasks
" Leave vims active directory at the root of your project
" Use :find [filename]
set path=**  " overwrite path (default has /usr/include)
set wildignore+=*.pyc*,*DS_Store*,*.ipynb,**/__pycache__

" Display all matching files when we tab complete
set wildmenu

set laststatus=2 " Status bar always visible
set statusline+=%F " Show filename in status bar

command! MakeTags !ctags -R .

:set ignorecase " Case insensitive file searching

" Jump into file finding mode when I press ctrl-P
nnoremap <C-P> :find *

" File Browing
let g:netrw_banner=0 " Disable annoying banner
let g:netrw_browse_split=4 " open in prior window
let g:altv=1 " open splits to the right
let netrw_liststyle=3 " Tree view

" Highlight trailing whitespace, but not when in insert mode
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
