set nocompatible        " Use Vim
filetype off            " required!

filetype plugin indent on
syntax on

set title               " change the terminal's title
set number              " show line numbers
set ruler               " show line and column number
set laststatus=2
set noautochdir
set viewdir=$HOME/.vimviews
set viewoptions=folds,cursor

" soft wrapping
set wrap
set linebreak
set nolist

set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent

set autoindent          " automatic indentation
set copyindent          " copy the previous indentation on auto-indenting

set ignorecase
set smartcase           " ignore case if search pattern is all lowercase
set nohlsearch            " highlights search results

set wildmenu                            " make tab completion act like bash
set wildignore=*.swp,*.pyc,*.class      " while tab completing, ignore these files

" Folding related
set foldenable
set foldlevel=99
set foldlevelstart=3
set foldmethod=marker
" which commands trigger auto-unfold
set foldopen=block,hor,insert,mark,percent,quickfix,search,tag,undo

set history=1000
set undolevels=1000
