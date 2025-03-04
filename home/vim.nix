{
  programs.vim.enable = true;
  programs.vim.defaultEditor = true;
  programs.vim.extraConfig = ''
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
    "               
    "               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
    "               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
    "               ██║   ██║██║██╔████╔██║██████╔╝██║     
    "               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
    "                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
    "                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
    "               
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
    
    syntax on

    set foldmethod=marker
    set number
    set cursorline
    set shiftwidth=2
    set tabstop=2
    set scrolloff=8
    set ignorecase
    set showmode
    set hlsearch
    set showmatch
    set history=1000
    set encoding=UTF-8
    set guifont=MesloLGS\ NF\ Regular
    set incsearch
    set rnu
    set autoread
    set splitright
    set hidden
    let mapleader = " "


    " PLUGINS  ------------------------------------------------------------ {{{
    
    call plug#begin('~/.vim/plugged')
    
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'PhilRunninger/nerdtree-visual-selection'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
    let g:UltiSnipsEditSplit="vertical"
    
    call plug#end()
    
    " }}}
    
    " KEYMAPS ------------------------------------------------------------ {{{
    
    nnoremap <leader>fd :NERDTreeToggle<CR>
    
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
    
    noremap <c-a>j <c-w>+
    noremap <c-a>k <c-w>-
    noremap <c-a>h <c-w>>
    noremap <c-a>l <c-w><
    
    nnoremap <ESC> :nohl<CR>
    nnoremap n nzz
    nnoremap N Nzz
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv
    
    vnoremap <leader>y "+y
    
    nnoremap <leader>y "+y
    nnoremap <leader>Y "+Y
    
    nnoremap <C-p> :w <CR>:!clear <CR>:!python3 % <CR>
    
    nnoremap <C-x> :vertical resize 40<CR>
    nnoremap <C-c> :w <CR> :!clang++ -Wall -std=c++20 '%' -o '%<' && '%<' <CR>
    nnoremap <C-t> :!command xforce test<CR>
    nnoremap <C-b> :edit main.cpp<CR>
    nnoremap <C-m> :edit output.txt<CR>
    nnoremap <C-n> :edit debug.txt<CR>
    nnoremap <C-,> :edit req_output.txt<CR>
    nnoremap <C-.> :edit input.txt<CR>
    
    nnoremap <leader>f :source ~/.vimrc <CR>
    nnoremap <leader><leader>w :vnew input.txt <CR> :new output.txt
    " }}}


    " COLOR SCHEME ----------------------------------------------------------- {{{

    set background=light
    hi Normal guibg=NONE ctermbg=NONE

    " let g:everforest_background = 'hard'
    " let g:everforest_better_performance = 1
    " let g:everforest_transparent_background = 1
    " let g:everforest_cursor = 'purple'
    " let g:everforest_show_eob = '0'
    set t_Co=256

    let g:gruvbox_italic=1
    let g:gruvbox_transparent_bg=0

    colorscheme gruvbox 

    " }}}

    
    " STATUS LINE ------------------------------------------------------------ {{{
    

    set statusline=
    set statusline+=\ %F\ %M\ %Y\ %R
    set statusline+=%=
    set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
    set laststatus=2
    
    " }}}
    
    
    " VIMSCRIPT -------------------------------------------------------------- {{{
    
    function Geet( name )
    
    	echo "hello" .. a:name
    	echo "world"
    endfunction
    
    :command MyCommand echo "Hello World"
    
    :command -nargs=1 Rd put ='println!(\"<args>: {:?}\", <args>);'
    :command -nargs=1 Yo call Geet(<args>)
    " }}}
  '';

}
