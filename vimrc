" ------------------------------------------------------------------------------
"  .vimrc
"  George Lesica <george@lesica.com>
"  My vimrc file. Settings are divided into semi-reasonable categories.
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Vundle initialization
" ------------------------------------------------------------------------------

set nocompatible " required
filetype off " required for vundle init

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mhinz/vim-signify'
Plugin 'osyo-manga/vim-over'
Plugin 'vimwiki/vimwiki'

call vundle#end()

" ------------------------------------------------------------------------------
"  Syntax and appearance
" ------------------------------------------------------------------------------

syntax on
colorscheme default
set encoding=utf-8
set laststatus=2
set mouse=a                     " Make the mouse work in terminal
set nocompatible
set number                      " Line numbering on
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)
set t_Co=256
set title                       " Modify terminal title

" ------------------------------------------------------------------------------
"  Default text and line formatting
" ------------------------------------------------------------------------------

set autoindent                  " Match indent level for new lines
set backspace=indent,eol,start  " More normal backspace behavior
set expandtab                   " Expand tabs to spaces
set foldlevel=10                " Number of folding levels
set foldmethod=indent           " Fold text based on indentation level
set nofoldenable                " Open all folds by default
set shiftwidth=4                " Autoindent 4 spaces
set smarttab                    " Backspace through space-tabs
set tabstop=4                   " Tab 4 spaces

" Set a width for text documents so wrapping happens automatically
" Also enable spell checking automatically
augroup document
    autocmd!
    autocmd BufRead,BufNewFile *.markdown setlocal spell
    autocmd BufRead,BufNewFile *.markdown setlocal textwidth=100
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal textwidth=100
    autocmd BufRead,BufNewFile *.rst setlocal spell
    autocmd BufRead,BufNewFile *.rst setlocal textwidth=100
    autocmd BufRead,BufNewFile *.tex setlocal spell
    autocmd BufRead,BufNewFile *.tex setlocal textwidth=100
    autocmd BufRead,BufNewFile *.txt setlocal spell
    autocmd BufRead,BufNewFile *.txt setlocal textwidth=80
    autocmd BufRead,BufNewFile *.wiki setlocal spell
    autocmd BufRead,BufNewFile *.wiki setlocal textwidth=80
    autocmd BufRead,BufNewFile *.wiki setlocal shiftwidth=2
    autocmd BufRead,BufNewFile *.wiki setlocal tabstop=2
    autocmd BufRead,BufNewFile *.bash_* setlocal filetype=sh
    autocmd BufRead,BufNewFile *.json setlocal shiftwidth=2
    autocmd BufRead,BufNewFile *.json setlocal tabstop=2
    autocmd BufRead,BufNewFile *.yaml setlocal shiftwidth=2
    autocmd BufRead,BufNewFile *.yaml setlocal tabstop=2
    autocmd BufRead,BufNewFile *.yml setlocal shiftwidth=2
    autocmd BufRead,BufNewFile *.yml setlocal tabstop=2
augroup END

" ------------------------------------------------------------------------------
"  File and file type handling
" ------------------------------------------------------------------------------

filetype on                     " Detect known file types
filetype plugin on              " Apply file type-specific rules
filetype indent on              " Auto-indent for known file types
set autowrite                   " Auto-save document
set hidden                      " Allow changes to exist in hidden buffers

" ------------------------------------------------------------------------------
"  Searching and manipulation
" ------------------------------------------------------------------------------

set incsearch                   " Auto move to first search occurence
set hlsearch                    " Highlight search hits

" Clear search highlighting with F3
nnoremap <F3> :nohlsearch<CR>
inoremap <F3> <esc>:nohlsearch<CR>i

" Center search results vertically
nnoremap n nzz
nnoremap N Nzz

" ------------------------------------------------------------------------------
"  Convenience commands and mappings
" ------------------------------------------------------------------------------

" Switch to next buffer with Ctrl-a
noremap <C-a> <esc>:bnext<cr>

" Replace spaces with tabs for makefiles
nnoremap <leader>stt :%s/^    /\t/<cr>

" Remove trailing white space
nnoremap <leader>tws :%s/\s\+$//<cr>

" Move lines up and down, respectively
nnoremap <C-k> ddkP
nnoremap <C-j> ddp
inoremap <C-k> <esc>ddkPi
inoremap <C-j> <esc>ddpi

" Edit vimrc file in a jiffy
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" ------------------------------------------------------------------------------
" EditorConfig
" ------------------------------------------------------------------------------

if strlen(system('which editorconfig')) > 0
    " Point at the binary
    let g:EditorConfig_exec_path = system('which editorconfig')
endif

" ------------------------------------------------------------------------------
" Vim Wiki
" ------------------------------------------------------------------------------

let g:vimwiki_list = [
            \{'path': '~/Wiki/wiki/', 'path_html': '~/Wiki/html/',
            \ 'auto_export': 1, 'auto_toc': 1, 'auto_tags': 1}
            \]

