if has('gui_running')
    set guioptions+=M
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions+=e
endif

syntax on
filetype on
filetype indent on
filetype plugin on

" Virtually all terminals now are 256-color enabled, but it's common to have
" wrong TERM set, for various reasons.
set t_Co=256

set autoindent
set background=dark
set backspace=indent,eol,start
set cindent
set cursorline
set cpoptions=aABceFsmq
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set mouse=
set number
set nobackup
set nocompatible
set noexrc
set nostartofline
set nowrap
set pastetoggle=<F6>
set scrolloff=0
set shiftround
set shiftwidth=4
set showbreak=>>>·
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set statusline=%-3.30([%F]%)%(%r%m%h%w%y%)%=[0x%02B(%03b)][line\ %l\ of\ %L][%c/%v][%P]
set tabstop=4
set textwidth=100000
set virtualedit=block
set visualbell
set wildmenu
set wildmode=list:longest

inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
nnoremap <CR>  :nohlsearch<CR>

if ( &t_Co == 256 )
    colorscheme delek
else
    highlight StatusLine ctermbg=black ctermfg=darkgreen
    highlight StatusLineNC ctermbg=gray ctermfg=darkgray
endif