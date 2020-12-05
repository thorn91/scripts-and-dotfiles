set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'neoclide/coc.nvim'
" Syntax
Plugin 'sheerun/vim-polyglot'

Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'frazrepo/vim-rainbow'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdcommenter'
Plugin 'xolox/vim-misc'

" Themes
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'gruvbox-community/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'rakr/vim-one'
Plugin 'fcpg/vim-fahrenheit'

Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/Colorizer'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Map leader key
let mapleader = ","

" Color Scheme & Binding
let g:one_allow_italics = 1
set termguicolors
let ayucolor = "mirage"
map <F1> :colorscheme gruvbox <CR>
map <F2> :colorscheme jellybeans <CR>
map <F3> :colorscheme nord <CR>
map <F4> :colorscheme PaperColor <CR>
map <F5> :colorscheme one <CR>
map <F6> :colorscheme ayu <CR>
map <F7> :colorscheme farenheit <CR>
map <F9> :set background=dark <CR>
map <F10> :set background=light <CR>

" Autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python Highlighting
let python_highlight_all=1

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

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
let g:indent_guides_enable_on_vim_startup = 1

" Allow showing and hiding tab characters
set invlist
set nolist
nmap <leader>l :set invlist<cr>

" autotrim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" handle tabs
"set listchars=tab:␉·
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
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>


" highlight bad whistespace
" "set list listchars=trail:.,extends:>

" folding by indent and keep folds open when file open
set foldmethod=indent

augroup OpenAllFoldsOnFileOpen
        autocmd!
        autocmd BufRead * normal zR
augroup END

" status line display
set laststatus=2

" DEBUG SECTION "
" GO
let g:go_debug_windows = {
    \ 'vars':       'rightbelow 60vnew',
    \ 'stack':      'rightbelow 10new',
\ }
