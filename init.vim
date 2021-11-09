call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdcommenter'
Plug 'ap/vim-css-color'
"Plug 'scrooloose/nerdtree'
"Plug 'stefandtw/quickfix-reflector.vim'
"Plug 'vim-airline/vim-airline'
call plug#end()

" testing this one!!!!!!!!!!!!!!!!
"disable scroll jump for the * and the shift-leftclick
" https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
nnoremap <silent> <S-LeftMouse> :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>

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
 nnoremap <leader>yy "*yy
 vnoremap <leader>y "*y
 " paste from clipboard
 nnoremap <leader>p "*p
 vnoremap <leader>p "*p
" copy to clipboard & default register
 vnoremap y "*y|"y
 vnoremap Y "*Y|"Y
 nnoremap yy "*yy|"yy
 nnoremap YY "*YY|"YY
 nnoremap yat "*yat|"yat
 nnoremap yit "*yit|"yit

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

" paste the 0 register
xnoremap <Leader>0p "0p
nnoremap <Leader>0p "0p

" cancel the hlsearch by hitting enter
nnoremap <CR> :nohlsearch<cr>

"non-greedy remaps
:cnoremap NG .\{-}

" add inner div to html tag
let @d = "vitkojO<div class=\"PLACEHOLDER\">gv>oo\<BS></div><!-- PLACEHOLDER -->/PLACEHOLDER\<CR>:%s///g\<Left>\<Left>"

"Rip grep remaps
nnoremap <Leader>rg gRg -g "!*main.css*" 
"rip grep replace in quickfix
nnoremap <Leader>rgr :cdo %s###gc<Left><Left><Left>
"fuzzy find remaps
nnoremap <Leader>ff :FZF<CR>

"this is my custom side preview window 'birds eye view'
nnoremap <Leader>bv :set splitright <bar> vsp <bar> setlocal foldmethod=indent <bar> vertical resize 50<CR>

"if has('macunix')
    ""mac only commands here
"endif
 
" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
 
" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*"'
endif

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

"testing bash command output and replace
":vnoremap qq c<C-R>=system('echo hi')<CR><ESC>

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
augroup END


let g:NERDCustomDelimiters = {
    \ 'php': {  'left': '// ', 'right': '', 'leftAlt': '<!-- ','rightAlt': ' -->' },
    \ 'less': {  'left': '// ', 'right': '', 'leftAlt': '/* ','rightAlt': ' */' },
\}
let NERD_php_alt_style=1
