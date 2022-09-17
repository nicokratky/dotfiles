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

call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-fugitive' " git commands
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'

call plug#end()

"******************
" Basic
"******************

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Tabs
set tabstop=4 
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent

autocmd FileType make set noexpandtab tabstop=8 softtabstop=8

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set wrap            " turn on line wrappeing
set wrapmargin=8    " wrap lines when coming within n characters from side
set linebreak       " set soft wrapping
set showbreak=…     " show ellipsis at breaking
set nolist
set textwidth=0
set wrapmargin=0

" sane line jumping
" keep cursor always centered
map j gjzz
map k gkzz

"******************
" Visual Settings
"******************

syntax on
set ruler

filetype plugin indent on

:set number relativenumber " hybrid line numbers

" automatically toggle between absolute and hybrid line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

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

let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
