set nocompatible                  " Must come first because it changes other options.
let mapleader = ','                  " Update leader character to be ,

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nowrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

"set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

colorscheme vividchalk            "github

map <leader>s :call ToggleScratch()<cr>
map <leader>r :w \| :! rake spec<cr>

map <F4> :set hlsearch! hlsearch?<cr>

"F7 WordProcessorOn
map <F7> :set linebreak<cr>:set display+=lastline<cr>:set wrap<cr>:setlocal spell spelllang=en_us<cr>
"F8 WordProcessorOff
map <F8> :set nowrap<cr>:set nospell<cr>

function! ToggleScratch()
  if (expand('%') == g:ScratchBufferName)
    quit
  else
    Sscratch
  endif
endfunction

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd BufRead,BufNewFile *.md setf markdown
