" VUNDLE Install

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Bundle 'alfredodeza/pytest.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Begin Normal vimrc
filetype on
filetype off
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set autoread

let mapleader=','

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80,100

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

inoremap jj <ESC>

" Disable pylint checking every save
let g:pymode_lint_write = 0

set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode = "passive"
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--max-line-length=100'
" Syntax highlighting speedup
let g:syntastic_enable_highlighting = 0

" Set key 'R' for run python code
let g:pymode_run_key = 'R'

" Load show documentation plugin
let g:pymode_doc = 1

" Key for show python documentation
let g:pymode_doc_key = 'K'

" Disable python folding
let g:pymode_folding = 0
let g:pep8_map='<leader>8'

" #Autocomplete
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" Auto-trim whitespace.
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Enable menu and pydoc preview
set completeopt=menuone,longest,preview


" Show linenumbers.
set number

" Tweaks for CtrlP Plugin
let g:ctrlp_custom_ignore = 'DS_Store\|build\|dist\|git\|.*\.pyc\|.+pyc\|node_modules\|bower_components\|tmp'

map <C-n> :NERDTreeToggle<CR>


" Remap window nav keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:vim_markdown_folding_disabled=1

" Automatically reformat markdown files to 80 characters
au BufRead,BufNewFile *.md setlocal textwidth=80

" Pytest
nmap <silent><Leader>f <Esc>:w\|:Pytest file verbose<CR>
nmap <silent><Leader>c <Esc>:w\|:Pytest class verbose<CR>
nmap <silent><Leader>m <Esc>:w\|:Pytest method verbose<CR>
