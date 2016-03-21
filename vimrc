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
Plugin 'elixir-lang/vim-elixir'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'idris-hackers/idris-vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'JuliaLang/julia-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-signify'
Plugin 'nanotech/jellybeans.vim'
Plugin 'osyo-manga/vim-over'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'zah/nimrod.vim'

" Conditional plugins

" Racer - Rust code completion engine
" https://github.com/phildawes/racer
if executable('racer')
    Plugin 'racer-rust/vim-racer'
endif

" GHC-Mod - Haskell completion engine
if executable('ghc-mod')
    Plugin 'eagletmt/ghcmod-vim'
    Plugin 'eagletmt/neco-ghc'
endif

" All of your Plugins must be added before the following line
call vundle#end()

" ------------------------------------------------------------------------------
"  Syntax and appearance
" ------------------------------------------------------------------------------

syntax on
colorscheme jellybeans
set bg=light
set encoding=utf-8
set laststatus=2
set mouse=a                     " Make the mouse work in terminal
set nocompatible
set number                      " Line numbering on
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)
set t_Co=256
set title                       " Modify terminal title

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ocaml_checkers = ['merlin']
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%{SyntasticStatuslineFlag()}

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
    autocmd BufRead,BufNewFile *.bash_* setlocal filetype=sh
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

" Start a new vim-over command line
nnoremap <F4> :OverCommandLine<CR>
set omnifunc=syntaxcomplete#Complete

" Center search results vertically
nnoremap n nzz
nnoremap N Nzz

" ------------------------------------------------------------------------------
"  Tagbar plugin (https://github.com/majutsushi/tagbar/)
" ------------------------------------------------------------------------------

" Toggle tagbar with F7
noremap <F7> <esc>:TagbarToggle<CR>

" Toggle tagbar and auto close with F8
noremap <F8> <esc>:TagbarOpenAutoClose<CR>

" Make tagbar work with Google Go
let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
\}

" Make tagbar work with Markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

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
nnoremap <C-k> ddkkp
nnoremap <C-j> ddp
inoremap <C-k> <esc>ddkkpi
inoremap <C-j> <esc>ddpi

" Edit vimrc file in a jiffy
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" ------------------------------------------------------------------------------
" Code shortcuts
" ------------------------------------------------------------------------------

augroup code
    autocmd!
    autocmd FileType python :iabbrev <buffer> iff if:<left>
    " Multi-line comments
    autocmd FileType javascript vnoremap <leader>mn :s/^/\/\//<cr>:nohlsearch<cr>
    autocmd FileType python vnoremap <leader>mn :s/^/#/<cr>:nohlsearch<cr>
    autocmd FileType julia vnoremap <leader>mn :s/^/#/<cr>:nohlsearch<cr>
augroup END

" ------------------------------------------------------------------------------
" Nerdtree commands
" ------------------------------------------------------------------------------

nnoremap <C-n> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ------------------------------------------------------------------------------
" EditorConfig
" ------------------------------------------------------------------------------

if strlen(system('which editorconfig')) > 0
    " Point at the binary
    let g:EditorConfig_exec_path = system('which editorconfig')

    " Make sure it works with Fugitive
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']
endif

" ------------------------------------------------------------------------------
" OCaml
" ------------------------------------------------------------------------------

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')

if isdirectory(g:opamshare)
    " $ opam install merlin
    execute "set rtp+=" . g:opamshare . "/merlin/vim"
    execute "helptags " . g:opamshare . "/merlin/vim/doc"

    " $ opam install ocp-indent
    "execute ":source " . g:opamshare . "/vim/syntax/ocp-indent.vim"
endif

" ------------------------------------------------------------------------------
" Julia
" ------------------------------------------------------------------------------

" I prefer two space indents instead of the default 4.
autocmd FileType julia setlocal tabstop=2
autocmd FileType julia setlocal shiftwidth=2

" ------------------------------------------------------------------------------
" Haskell
" ------------------------------------------------------------------------------

autocmd FileType haskell setlocal tabstop=2
autocmd FileType haskell setlocal shiftwidth=2

if executable('ghc-mod')
    " Disable haskell-vim omnifunc
    let g:haskellmode_completion_ghc = 0
    let g:necoghc_enable_detailed_browse = 1
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
endif

let g:haskell_tabular = 1

