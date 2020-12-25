set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim'
" Syntax
Plugin 'sheerun/vim-polyglot'

" Language
Plugin 'fatih/vim-go'
Plugin 'puremourning/vimspector'

Plugin 'szw/vim-maximizer'
Plugin 'scrooloose/nerdtree'
Plugin 'frazrepo/vim-rainbow'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdcommenter'
Plugin 'xolox/vim-misc'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Themes
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'gruvbox-community/gruvbox'
Plugin 'arcticicestudio/nord-vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'rakr/vim-one'
Plugin 'cocopon/iceberg.vim'
Plugin 'artanikin/vim-synthwave84'
Plugin 'pgavlin/pulumi.vim'
Plugin 'megantiu/true.vim'
Plugin 'raphamorim/lucario'

""Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/Colorizer'
"Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
""Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Map leader key and escape key
inoremap jj <Esc>
let mapleader = "\<Space>"
"let mapleader = ","
"nnoremap <silent> <Leader><Space> :Files<CR>

" au filetype go inoremap <buffer> . .<C-x><C-o>

" Color Scheme & Binding
"colorscheme nord
let g:gruvbox_italic=1
let g:one_allow_italics = 1
set termguicolors
let ayucolor = "mirage"
let g:true_airline = 1
let g:airline_theme='true'
map <leader><F1> :colorscheme gruvbox <CR>
map <leader><F2> :colorscheme nord<CR>
map <leader><F3> :colorscheme pulumi <CR>
map <leader><F4> :colorscheme PaperColor <CR>
map <leader><F5> :colorscheme lucario <CR>
map <leader><F6> :colorscheme ayu <CR>
map <leader><F7> :colorscheme iceberg <CR>
"map <leader><F9> :colorscheme synthwave84 <CR>
map <leader><F9> :colorscheme true <CR>

map <leader>- :set background=dark <CR>
map <leader>= :set background=light <CR>

" Autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python
let python_highlight_all=1
autocmd FileType python map <buffer> <leader><F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <leader><F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Nerdtree
map <leader>o :NERDTreeToggle<CR>

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
" set cursorline

" filetype detection and loading files based on it
" files go in ex: ~/.vim/indent/python.vim
filetype indent on

" highlight matching [{()}]
set showmatch

" Automatic Brackets
"inoremap ( ()<Esc>:let leavechar=")"<CR>i
"inoremap [ []<Esc>:let leavechar="]"<CR>i
"inoremap { {}<Esc>:let leavechar="}"<CR>i
"inoremap {<CR> {<CR>}<Esc>O<BS><Tab>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>


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

nnoremap <C-p> :Gfiles<CR>






" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"=============== End COC ==================================="

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
