set nocompatible        " Use Vim
filetype off            " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" github repos
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'int3/vim-extradite'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'bingaman/vim-sparkup'
Bundle 'tsaleh/vim-matchit'
Bundle 'altercation/vim-colors-solarized'
Bundle 'godlygeek/tabular'
Bundle 'SirVer/ultisnips'
Bundle 'gregsexton/MatchTag'
Bundle 'taglist.vim'

" filetype plugins
Bundle 'tpope/vim-markdown'
Bundle 'groenewege/vim-less'

filetype plugin indent on
syntax on

" colors
let g:solarized_contrast = "high"
set t_Co=256
set background=dark
color solarized

set title               " change the terminal's title
set number              " show line numbers
set ruler               " show line and column number
set laststatus=2
set noautochdir
set viewdir=$HOME/.vimviews
set viewoptions=folds,cursor

set shell=/bin/bash

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

" Command overrides
"---------------------------------------
command! Q q
command! W w
command! Qall qall

" Maps
"---------------------------------------
nmap <leader>q :q<CR>
nmap <leader>ww :w<CR>
nmap <leader>wq :wq <CR>

" persist visual selection for indenting
vnoremap < <gv
vnoremap > >gv

" Make Y behave like other capitals
nnoremap Y y$

" Next, previous buffers
nmap <space> :bn<CR>
nmap <leader><space> :bp<CR>

" Splitting and closing windows 
nmap <leader>v <C-w>v
nmap <leader>s <C-w>s
nmap <leader>x <C-w>c
nmap <leader>d :bp<CR>:bd#<CR>

" search for word under cursor
nnoremap <leader><bs> :Ack! '\b<c-r><c-w>\b'<CR>


" Move between opened windows
map <C-j> :CtrlPBuffer<CR>
map <C-k> :CtrlPMRUFiles<CR>

" Resize windows vertically
map <C-right> :vertical:resize +5<CR>
map <C-left> s:vertical:resize -5<CR>
map <C-up>    :resize +5<CR>
map <C-down>  :resize -5<CR>

map <leader>y "+yy
map <leader>p "+p

" Use better characters for tabstops and EOLs, 
" <C-v> can be used to insert unicode characters
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

nmap <leader>t :tabe<CR>
nmap <leader>rc :tabe $MYVIMRC<CR>
nmap <leader>rs :so $MYVIMRC<CR>

nmap [t :tabp<CR>
nmap ]t :tabn<CR>
nmap [q :cprev<CR>
nmap ]q :cnext<CR>

nmap <leader>bb :e $HOME/.bashrc<CR>
nmap <leader>ba :e $HOME/bin/dotfiles/bash/aliases<CR>
nmap <leader>bc :e $HOME/bin/dotfiles/bash/config<CR>
nmap <leader>be :e $HOME/bin/dotfiles/bash/env<CR>
nmap <leader>bm :e $HOME/bin/dotfiles/bash/my_aliases<CR>
nmap <leader>bt :e $HOME/.tmux.conf<CR>

autocmd FileType python map <buffer> <leader>0 :call <SID>StripTrailingWhitespaces()<CR>

if has("autocmd")
    "syntax demands
    au FileType make setlocal ts=8 sts=8 sw=8 noet
    au FileType yaml setlocal ts=2 sts=2 sw=2 et
    au FileType css setlocal ts=2 sts=2 sw=2 et
    au FileType ruby setlocal ts=2 sts=2 sw=2 et
    au FileType jade setlocal ts=2 sts=2 sw=2 et
    au FileType coffee setlocal ts=2 sts=2 sw=2 et
    au FileType less setlocal ts=2 sts=2 sw=2 et
    " autocmd FileType python setlocal tw=80

    " Remove trailing whitespaces for py, js
    " au BufWritePre *.py :call <SID>StripTrailingWhitespaces()
    au BufEnter * let &titlestring = expand("%")

    au BufNewFile,BufRead *.rss,*.atom setfiletype xml
    au! BufRead,BufNewFile *.json setfiletype json
endif

function! <SID>StripTrailingWhitespaces()
    " Save last search and cursor positions
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Remove trailing whitespace
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/ = _s
    call cursor(l, c)
endfunction
