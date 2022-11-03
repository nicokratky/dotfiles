let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
    if !executable('curl')
        echoerr 'You have to install curl of first install vim-plug yourself!'
        execute 'q!'
    endif
    echo 'Installing vim-plug...'
    echo ''
    silent exec '!\curl -fLo ' . vimplug_exists . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    let g:not_finish_vimplug='yes'

    autocmd VimEnter * PlugInstall
endif

call plug#begin()

" git
Plug 'airblade/vim-gitgutter'   " git diff markers
Plug 'tpope/vim-fugitive'       " git commands

" visual
Plug 'chriskempson/base16-vim'  " base 16 colors
Plug 'itchyny/lightline.vim'    " statusbar
Plug 'junegunn/goyo.vim'        " distraction-free writing
Plug 'ryanoasis/vim-devicons'   " add icons

" languages
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'

" misc
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary' " comment stuff out

call plug#end()

"******************
" Basic
"******************

let mapleader=","

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Tabs
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

autocmd FileType make set noexpandtab tabstop=8 softtabstop=8

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set wrap            " turn on line wrappeing
set linebreak       " set soft wrapping
set showbreak=      " show ellipsis at breaking
set nolist
set textwidth=0
set wrapmargin=0

" sane line jumping
" keep cursor always centered
map j gj
map k gk

nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>

"******************
" Visual Settings
"******************

syntax on

filetype plugin indent on

:set number relativenumber " hybrid line numbers

let base16colorspace=256
colorscheme base16-default-dark

"******************
" Splits
"******************

" sane split switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

"******************
" Plugins
"******************

map <silent> <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1 " show hidden files by default

let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_view_method='skim'
