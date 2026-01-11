" NOTE: To install vim-plug, run:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then run :PlugInstall inside vim to install the plugins below

" Vim-Plug plugin manager
call plug#begin('~/.vim/plugged')

" Core functionality plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" UI enhancement plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Leader key configuration
let mapleader=" "

" Basic settings
set history=1000
set ruler
set showcmd
set wildmenu
set scrolloff=5
set hlsearch
set relativenumber
set incsearch
set ignorecase
set smartcase
set number
set lbr
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set hidden

" Key mappings
map Y y$
map <leader>w :w!<CR>

" Window navigation
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

" Buffer management
map <leader>ba :bufdo bd<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Misc mappings
map 0 ^

" Plugin configurations
" NERDTree
map <leader>e :NERDTreeToggle<CR>

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Airline
let g:airline_powerline_fonts = 1

" GitGutter
let g:gitgutter_enabled = 1
