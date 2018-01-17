set encoding=utf-8
set nocompatible            " required
let mapleader=";"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'duff/vim-scratch'
Plugin 'Vimjas/vim-python-pep8-indent'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'davidoc/taskpaper.vim'
Plugin 'morhetz/gruvbox'
" all of your plugins must be added before the following line
call vundle#end()

set background=dark
colorscheme gruvbox

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set laststatus=2
"------------Start Python PEP 8 stuff----------------
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

au BufWrite *.py,*.pyw :Autoformat

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

"----------Stop python PEP 8 stuff--------------

au BufWrite *.js :Autoformat
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>f :Autoformat<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

set number
"set clipboard=unnamedplus
set noswapfile
set relativenumber

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
    let g:ctrlp_working_path_mode = 'c'
endif

nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>

map <F7> :set linebreak<cr>:set display+=lastline<cr>:set wrap<cr>:setlocal spell spelllang=en_us<cr>
map <F8> :set nowrap<cr>:set nospell<cr>

"let g:autoformat_verbosemode=1
