{ pkgs, ... }:

{
  enable = true;

  # Specify plugins to install
  plugins = with pkgs.vimPlugins; [
    # Core functionality plugins
    fzf-vim
    nerdtree
    vim-commentary
    vim-fugitive
    vim-surround

    # UI enhancement plugins
    vim-airline
    vim-airline-themes
    vim-gitgutter
  ];

  # Custom Vim configuration
  extraConfig = ''
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
  '';
}
