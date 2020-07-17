set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'frazrepo/vim-rainbow'
Plugin 'preservim/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'chrisbra/Colorizer'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Map leader key
let mapleader = ","

" Autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python Highlighting
let python_highlight_all=1

" Nerdtree
map <C-o> :NERDTreeToggle<CR>

" Rainbow Brackets
let g:rainbow_active = 1

" Remap split controls
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fold controls
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" syntax
filetype plugin indent on
syntax on

" handle tabs and indents 
set tabstop=4
set shiftwidth=4
set expandtab

" autotrim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" handle tabs
set listchars=tab:␉·
" 
" line numbers
set number

" shows last command in bottom right
set showcmd

" highlight current line
set cursorline

" filetype detection and loading files based on it
" files go in ex: ~/.vim/indent/python.vim
filetype indent on

" highlight matching [{()}]
set showmatch

" Automatic Brackets
"inoremap ( ()<Esc>:let leavechar=")"<CR>i
"inoremap [ []<Esc>:let leavechar="]"<CR>i
"inoremap { {}<Esc>:let leavechar="}"<CR>i
inoremap {<CR> {<CR>}<Esc>O<BS><Tab>
"
" highlight bad whistespace
set list listchars=trail:.,extends:>

" folding by indent and keep folds open when file open
set foldmethod=indent

augroup OpenAllFoldsOnFileOpen
        autocmd!
        autocmd BufRead * normal zR
augroup END

" status line display
set laststatus=2

let java_highlight_functions = 1 
let java_highlight_all = 1 
" If you are trying this at runtime, you need to reload the syntax file
set filetype=java  

" Some more highlights, in addition to those suggested by cmcginty 
highlight link javaScopeDecl Statement
highlight link javaType Type 
highlight link javaDocTags PreProc
