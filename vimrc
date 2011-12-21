let mapleader=","

set hidden

"" Load pathogen plugins
call pathogen#infect() 

"" Looks good
colorscheme koehler

"" Looks good enough and bit enough I can read
set guifont=Andale\ Mono:h14

cnoremap %% <C-R>=expand('%:h').'/'<cr>

"" Map in CtrlP
map <leader>f :CtrlP %:p:h<cr>
map <leader>F :CtrlPMRU<cr>
map <leader>b :CtrlPBuffer<cr>

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.rbc,*.class,coverage/*
"" map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

"" Buffer toggle
nnoremap <leader><leader> <c-^>

"" Show statusline always and make it pretty
""set modeline
set ls=2
set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y%=%c,%l/%L\ %P

map <Leader># <Plug>NERDCommenterToggle

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

"" Map <C-Movement Keys> to move around windows
map <C-L> <C-W>l
map <C-K> <C-W>k
map <C-J> <C-W>j
map <C-H> <C-W>h

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
