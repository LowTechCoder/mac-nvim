"vim only
set nocompatible
set cursorline
let &t_SI .= "\e[6 q"
let &t_EI .= "\e[2 q"
set backspace=indent,eol,start
set hlsearch
set path+=**
"end vim only

" testing this one!!!!!!!!!!!!!!!!
"disable scroll jump for the * and the shift-leftclick
" https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>

" change leader to space, and make sure nothing else uses that
nnoremap <SPACE> <Nop>
let mapleader=" "

" jj does ESC in insert mode
imap jj <Esc>
"imap <Leader>j <Esc>
"imap <Leader>f <Esc>

" disable auto comment next line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
" allow comments '//' comments in json
autocmd FileType json syntax match Comment +\/\/.\+$+

set mouse=a
" Stop the fancy auto indent, but keep the basic one
:set autoindent
:set nosmartindent
:set nocindent
:set indentexpr=
filetype indent off
 
""select all
nnoremap <leader>sa ggVG
"select to end
nnoremap <leader>se v$
"select to beginning
nnoremap <leader>sb v^
"save
nnoremap <leader>w :w<CR>

 " copy to clipboard.  Normally "*y
 nnoremap <leader>yy "*yy\|"+yy
 vnoremap <leader>y "*y\|"+y
 " paste from clipboard
 nnoremap <leader>p "*p\|"+p
 vnoremap <leader>p "*p\|"+p
" copy to clipboard & default register
 vnoremap y "*y\|"+y\|"y
 vnoremap Y "*Y\|"+Y\|"Y
 nnoremap yy "*yy\|"+yy\|"yy
 nnoremap YY "*YY\|"+YY\|"YY
 nnoremap yat "*yat\|"+yat\|"yat
 nnoremap yit "*yit\|"+yit\|"yit

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" better tabbing indenting
vnoremap < <gv
vnoremap > >gv
nnoremap < v<
nnoremap > v>

" tab to navigate buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" select and replace all or what is visual selected
nnoremap <Leader>ra :%s###g<Left><Left>
xnoremap <Leader>ra :s###g<Left><Left>

" select and replace next with question
nnoremap <Leader>r :%s###gc<Left><Left><Left>
xnoremap <Leader>r :s###gc<Left><Left><Left>

" cancel the hlsearch by hitting enter
nnoremap <CR> :nohlsearch<cr>

"non-greedy remaps
:cnoremap NG .\{-}

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
 
"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" switch buffers without saving file
set hidden
" turn relative line numbers on
:set rnu
" tabs
"set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set tabstop=4 softtabstop=0 expandtab shiftwidth=4

" Enables cursor line position tracking:
set cursorline

" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
function! g:FckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FckThatMatchParen()
a
