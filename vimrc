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
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'davidoc/taskpaper.vim'
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'

" colorschemes
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lifepillar/vim-solarized8'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'arcticicestudio/nord-vim'


" all of your plugins must be added before the following line
call vundle#end()

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
set termguicolors
syntax enable
colorscheme solarized8_flat

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

" Keep indentation level from previous line:
autocmd FileType python set autoindent

"----------Stop python PEP 8 stuff--------------

au BufWrite *.js :Autoformat
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType taskpaper setlocal ts=4 sts=4 sw=4 noexpandtab

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>f :Autoformat<CR>

autocmd FileType markdown,mkd let g:markdown_folding=1


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

    let g:ctrlp_show_hidden = 1
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>


map <F7> :set linebreak<cr>:set display+=lastline<cr>:set wrap<cr>:setlocal spell spelllang=en_us<cr>
map <F8> :set nowrap<cr>:set nospell<cr>

"let g:autoformat_verbosemode=1

let g:task_paper_follow_move=0

let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc


augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END


