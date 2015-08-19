set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'kien/ctrlp.vim'

"Plugin 'scrooloose/syntastic'

Plugin 'mileszs/ack.vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'chriskempson/base16-vim'

Plugin 'tpope/vim-surround'

call vundle#end()

set directory=~/.vim/swap

syntax on
filetype plugin indent on

let mapleader=","

colorscheme molokai

map <leader>f :CtrlP<cr>
map <leader>F :CtrlPBuffer<cr>
map <leader>c :ccl<cr>
map <leader>, :bp<cr>

map <leader>z :ZoomWin<cr>

map <leader>t :TagbarToggle<cr>

"map <leader>e :Errors<cr>
map <leader>z :ZoomWin<cr>

map <Leader># <Plug>NERDCommenterToggle

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>d <Plug>(go-doc)
"au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)


let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1

set ls=2
set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y\ %=%c,%l/%L\ %P
"set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y\ %#warningmsg#%{SyntasticStatuslineFlag()}%*\ %=%c,%l/%L\ %P

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.rbc,*.class,coverage/*

let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"

"Window movement keys
map <C-L> <C-W>l
map <C-K> <C-W>k
map <C-J> <C-W>j
map <C-H> <C-W>h

let g:ycm_collect_identifiers_from_tags_files = 1
set encoding=utf-8
set showcmd                     " display incomplete commands
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set number                      " line numbers

autocmd FileType go :setlocal noexpandtab
autocmd BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.md set filetype=markdown

"" update gotags on save/read
"au BufWritePost *.go silent! !gotags -sort -silent *go > tags &
"au BufReadPost *.go silent! !gotags -sort -silent *go > tags &

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

" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" YCM options after these other plugins (the defaults of vim-go changed
" somehow)
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
set completeopt-=preview

let g:vim_markdown_folding_disabled=1
set completeopt=menu
