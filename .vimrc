"/////////////////////////////////////////////////////////////////////////////
" Vundle Settings && Plugins
"/////////////////////////////////////////////////////////////////////////////

set nocompatible              " be iMproved, required
filetype off                  " required vundle begin

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin() " alternatively, pass a path where Vundle should install plugins

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'L9'
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#quickfix#enabled = 1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#bufferline#enabled = 1
let g:airline_powerline_fonts = 1

Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache.vim'
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 0 "最好关闭，要不提示太频繁
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_enable_auto_select = 1

Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled = 0

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()             " required
filetype plugin indent on     " required vundle end

"/////////////////////////////////////////////////////////////////////////////
" Key Mappings
"/////////////////////////////////////////////////////////////////////////////
let mapleader=','
nnoremap <F12> <Esc>:! /usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
imap <silent>jj <ESC> " map ESC with jj
imap <silent>jw <ESC>:w<CR> " map ESC with jj
map <silent><leader>l <ESC>:IndentLinesToggle<CR>
" easy diff goto
noremap <C-k> [c
noremap <C-j> ]c
nnoremap <leader>/ :let @/=""<CR>
" easy buffer navigation
nnoremap <C-l> :bn<CR>
noremap <C-h> :bp<CR>
vmap <leader>y :w !pbcopy<CR><CR>
nmap <leader>p :r !pbpaste<CR><CR>

"/////////////////////////////////////////////////////////////////////////////
" General
"/////////////////////////////////////////////////////////////////////////////

set backspace=indent,eol,start " allow backspacing over everything in insert mode
syntax on
set expandtab
set shiftwidth=4
set softtabstop=4
set hlsearch
set cst
"set cul
set list
set lcs=tab:>-,nbsp:%,trail:-
set ai
set si
set nu
set encoding=utf-8
set termencoding=utf-8
scriptencoding utf-8
" define the copy/paste judged by clipboard
set clipboard=unnamed
set laststatus=2 " always have status-line
set mouse=a

"set path=.,/usr/include/*,, " where gf, ^Wf, :find will search
set backup " make backup file and leave it around

" setup back and swap directory
let data_dir = $HOME.'/.data/'
let backup_dir = data_dir . 'backup'
let swap_dir = data_dir . 'swap'
let undo_dir = data_dir . 'undo'
if finddir(data_dir) == ''
    silent call mkdir(data_dir)
endif
if finddir(backup_dir) == ''
    silent call mkdir(backup_dir)
endif
if finddir(swap_dir) == ''
    silent call mkdir(swap_dir)
endif
if finddir(undo_dir) == ''
    silent call mkdir(undo_dir)
endif
unlet backup_dir
unlet swap_dir
unlet data_dir
unlet undo_dir

set backupdir=$HOME/.data/backup " where to put backup file
set directory=$HOME/.data/swap " where to put swap file

" Redefine the shell redirection operator to receive both the stderr messages and stdout messages
set hidden " 允许未保存切换缓冲区
set shellredir=>%s\ 2>&1
set history=200 " keep 50 lines of command line history
if has('persistent_undo')
    set undolevels=200
    set undodir=$HOME/.data/undo "where to put undo file
    set undofile
endif
set updatetime=4000 " default = 4000
set autoread " auto read same-file change ( better for vc/vim change )
set maxmempattern=2000000 " enlarge maxmempattern from 1000 to ... (2000000 will give it without limit)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe("normal! g'\"") | endif "打开文件时,按照 viminfo 保存的上次关闭时的光标位置重新设置光标
