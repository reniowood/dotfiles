set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'junegunn/gv.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

call plug#end()

" NERDTree
" Map Ctrl + e to NERDTreeToggle
map <C-e> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

" Exclude files and directores 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_errorformat = '%f:%l:%c: %trror: %m'

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_errorformat = '%f:%l:%c: %trror: %m'
let g:syntastic_cpp_checkers = ['clang-check', 'gcc']

let g:syntastic_html_checkers = []
let g:syntastic_eruby_checkers = []
let g:syntastic_javascript_checkers = ['eslint']

" YouCompleteMe

let g:ycm_show_diagnostics_ui = 0 " for compatiblity with syntastic
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" gruvbox

color gruvbox

" airline

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" vim-gitgutter

let g:gitgutter_max_signs=1024

" Vim settings

filetype plugin indent on
syntax on
scriptencoding=utf-8

set history=1000

set nobackup

set background=dark
set term=xterm-256color
set t_Co=256
set showmode

set cursorline

highlight clear SignColumn
highlight clear LineNr

if has('cmdline_info')
	set ruler " Show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd " Show partial commands in status line and
	" Selected characters/lines in visual mode
endif

if has('statusline')
	set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\ 	" Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\[%{&ff}/%Y] " Filetype
	set statusline+=\[%{getcwd()}] " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\%p%% " Right aligned file nav info
endif

set backspace=indent,eol,start
set linespace=0
set nu
set numberwidth=4
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=longest,full
set noswapfile

set wrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4

set foldcolumn=1

let mapleader = ','

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby.html setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
