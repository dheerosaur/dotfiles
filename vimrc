set nocompatible        " Use Vim
filetype off            " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" github repos
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'int3/vim-extradite'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bingaman/vim-sparkup'
Plugin 'vim-scripts/matchit.zip'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'gregsexton/MatchTag'
Plugin 'majutsushi/tagbar'
Plugin 'benmills/vimux'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vimwiki/vimwiki'

" filetype plugins
Plugin 'tpope/vim-markdown'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'jinfield/vim-nginx'
Plugin 'othree/html5.vim'
Plugin 'mxw/vim-jsx'

call vundle#end()

filetype plugin indent on
syntax on

" colors
let g:solarized_contrast="high"
set t_Co=256
color solarized
set background=dark

" set spell
set number              " show line numbers
set norelativenumber
set ruler               " show line and column number
set laststatus=2
set noautochdir
set scrolloff=5
set viewdir=$HOME/.vimviews
set viewoptions=folds,cursor

set shell=/bin/bash

" soft wrapping
set wrap
set linebreak
set nolist
set backspace=indent,eol,start

set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent

set autoindent          " automatic indentation
set copyindent          " copy the previous indentation on auto-indenting

set clipboard=unnamed

set ignorecase
set smartcase           " ignore case if search pattern is all lowercase
set nohlsearch            " highlights search results

set wildmenu                            " make tab completion act like bash
set wildignore=*.swp,*.pyc,*.class      " while tab completing, ignore these files

" save folds
au BufWinLeave ?* silent! mkview
au BufWinEnter ?* silent! loadview
au TabLeave ?* silent! mkview
au TabEnter ?* silent! loadview

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
nmap <leader>n :set relativenumber!<CR>

" search for word under cursor
nnoremap <leader><bs> :Ack! '\b<c-r><c-w>\b'<CR>


" Move between opened windows
map <C-j> :CtrlPBuffer<CR>
map <C-k> :CtrlPMRUFiles<CR>

" Resize windows vertically
map <C-right> :vertical:resize +5<CR>
map <C-left> :vertical:resize -5<CR>
map <C-up> :resize +5<CR>
map <C-down> :resize -5<CR>

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
nmap <leader>ba :e $HOME/dotfiles/bash/aliases<CR>
nmap <leader>bc :e $HOME/dotfiles/bash/config<CR>
nmap <leader>bl :e $HOME/dotfiles/bash/localrc<CR>

autocmd FileType python map <buffer> <leader>0 :call <SID>StripTrailingWhitespaces()<CR>

if has("autocmd")
    "syntax demands
    au FileType make setlocal ts=8 sts=8 sw=8 noet
    au FileType yaml setlocal ts=2 sts=2 sw=2 et
    au FileType ruby setlocal ts=2 sts=2 sw=2 et

    au FileType javascript setlocal ts=2 sts=2 sw=2 et
    au FileType coffee setlocal ts=2 sts=2 sw=2 et
    au FileType jade setlocal ts=2 sts=2 sw=2 et

    au FileType scss setlocal ts=2 sts=2 sw=2 et
    au FileType less setlocal ts=2 sts=2 sw=2 et
    au FileType css setlocal ts=2 sts=2 sw=2 et

    au FileType html setlocal ts=2 sts=2 sw=2 et

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

" Fugitive
set previewheight=15
nmap <C-g> :Gstatus<CR>
nmap <leader>gh :Git hist<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gw :Gwrite<CR>

" ctrlp
set wildignore+=*/tmp/*,*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files', 'find %s -type f']
let g:ctrlp_working_path_mode = 2
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_exclude = '/tmp/.*\|\.git/.*'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'crap$|site_media$|\/tmp$',
  \ 'file': '\.pyc$\|\.min.js$|\.jpg$|\.png$|\.gif$',
  \ }

" powerline
let g:Powerline_symbols='fancy'

" Plugin mappings
map <F3> :NERDTreeToggle<CR>

nnoremap <leader>8 :SyntasticCheck<CR>
nnoremap <leader>9 :SyntasticToggleMode<CR>
let g:syntastic_python_checkers = ['flake8']

" vim surround django mappings
let g:surround_{char2nr("s")} = "{% static \"\r\" %}"
let g:surround_{char2nr("t")} = "{% trans \"\r\" %}"
let g:surround_{char2nr("b")} = "{% blocktrans %}\r{% endblocktrans %}"
let g:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" Taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 40
let Tlist_Use_Right_Window = 0
let Tlist_GainFocus_On_ToggleOpen = 1
nmap <F4> :TlistToggle<CR>

let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)

" Tagbar
nmap <F4> :TagbarToggle<CR>
let g:tagbar_left = 1

" vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"


function! Reddit()
    tabnew
    silent read http://www.reddit.com/r/vim.json 
    %!python -m json.tool
    exe 'v/\v^\s+"(ti|ur)/d'
    %norm df:x
endfunction
command! Reddit call Reddit()

function! Google ()
    exec "!google-chrome http://google.com/search?q=".expand("<cword>")
endfunction
map <leader>G :call Google()<CR>

if filereadable(".lvimrc")
    source .lvimrc
endif

let g:gitgutter_enabled = 0

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'ubaryd'

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

map ,t :call VimuxRunCommand('clear; djt')<CR>
