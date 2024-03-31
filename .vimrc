" Change leader key to ','
let mapleader=","

" Increase command history to 1,000
set history=1000
" Show cursor position
set ruler
" Show incomplete commands
set showcmd
" Enhance command line completion
set wildmenu
" Keep 7 lines when scrolling
set scrolloff=7
" Highlight search matches
set hlsearch
" Incremental search
set incsearch
" Search case insensitive
set ignorecase
" Case-sensitive if uppercase present
set smartcase
" Show line numbers
set number
" Break lines at word (not in the middle)
set lbr
" Auto-indent new lines
set autoindent
" Smart indentation
set smartindent
" Use spaces instead of tabs
set expandtab
" Smart tabs handling
set smarttab
" Indentation amount for < and >
set shiftwidth=4
" Number of spaces tabs count for
set tabstop=4

" Key mappings section
" Make Y behave like C and D
map Y y$
" Quick save command
map <leader>w :w!<cr>
" Map space to search
map <space> /
" Map Ctrl-space to reverse search
map <C-space> ?
" Clear search highlighting
map <silent> <leader><cr> :noh<cr>
" Navigation between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Close all buffers
map <leader>ba :bufdo bd<cr>
" Next buffer
map <leader>l :bnext<cr>
" Previous buffer
map <leader>h :bprevious<cr>
" Jump to first non-blank character
map 0 ^
" Allow unsaved buffer switching
set hidden

" 1. Install vim-plug:
"    Run: curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Plugin management with vim-plug
call plug#begin('~/.vim/plugged')

" Core functionality plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" UI Enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Plugin mappings section
" Toggle NERDTree
map <leader>n :NERDTreeToggle<CR>
" Search files with fzf
nnoremap <leader>f :Files<CR>
" Search buffers with fzf
nnoremap <leader>b :Buffers<CR>

" Additional configurations for plugins
" Use powerline fonts if available
let g:airline_powerline_fonts = 1
" Enable gitgutter by default
let g:gitgutter_enabled = 1

" Misc settings
" Add any additional settings here
