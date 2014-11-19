let mapleader=","

set hidden

set directory=~/.vim/swap

let g:ctrlp_working_path_mode = 0

"" Load pathogen plugins
call pathogen#infect() 

"" Looks good
colorscheme torte

"" Looks good enough and big enough I can read
set guifont=Andale\ Mono:h14

cnoremap %% <C-R>=expand('%:h').'/'<cr>

"" Map in CtrlP
map <leader>f :CtrlP<cr>
map <leader>F :CtrlPMRU<cr>
map <leader>b :CtrlPBuffer<cr>

map <leader>z :ZoomWin<cr>

map <leader>t :TagbarToggle<cr>

let g:syntastic_auto_loc_list = 0
map <leader>e :Errors<cr>
map <leader>1 :ll 1<cr>
map <leader>2 :ll 2<cr>
map <leader>3 :ll 3<cr>
map <leader>4 :ll 4<cr>
map <leader>5 :ll 5<cr>
map <leader>6 :ll 6<cr>
map <leader>7 :ll 7<cr>
map <leader>8 :ll 8<cr>
map <leader>9 :ll 9<cr>
map <leader>0 :ll 10<cr>

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.rbc,*.class,coverage/*
"" map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

"" Buffer toggle
nnoremap <leader><leader> <c-^>

"" Show statusline always and make it pretty
""set modeline
set ls=2
set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y\ %#warningmsg#%{SyntasticStatuslineFlag()}%*\ %=%c,%l/%L\ %P

map <Leader># <Plug>NERDCommenterToggle

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

"" Map <C-Movement Keys> to move around windows
map <C-L> <C-W>l
map <C-K> <C-W>k
map <C-J> <C-W>j
map <C-H> <C-W>h

"  Tagbar Stuff
map <Leader><Tab> :TagbarToggle<CR>

" YouCompleteMe
"
let g:ycm_collect_identifiers_from_tags_files = 1

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

autocmd FileType go :setlocal noexpandtab

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

autocmd BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.md set filetype=markdown

"" Super Tab or gocode
let g:SuperTabDefaultCompletionType = "context"

"" Check syntax on open
let g:syntastic_check_on_open=1

"" update gotags on save/read
au BufWritePost *.go silent! !gotags -sort -silent *go > tags &
au BufReadPost *.go silent! !gotags -sort -silent *go > tags &

"" gotags support for tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

let g:vim_markdown_folding_disabled=1

noremap <leader>w :exe "GoDef" <CR>
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <buffer> <leader>i :exe 'GoImport ' . expand('<cword>')<CR>

