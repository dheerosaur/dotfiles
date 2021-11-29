set nocompatible        " Use Vim
filetype off            " required!

call plug#begin('~/.vim/plugged')

" ================
" Plugins
" ================

" Git related
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'

" github repos
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" File system related
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'editorconfig/editorconfig-vim'

" Look and feel
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'

" HTML related plugins
Plug 'mattn/emmet-vim'
Plug 'andymass/vim-matchup'

" Other useful plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'benmills/vimux'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-abolish'
Plug 'ludovicchabant/vim-gutentags'

" Snippets
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'github/copilot.vim'

" filetype plugins
Plug 'tpope/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'jinfield/vim-nginx'
Plug 'othree/html5.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'vim-test/vim-test'

call plug#end()

filetype plugin indent on
syntax on

" colors
set t_Co=256
let g:solarized_contrast="high"
color solarized
set background=dark

" set spell
set number              " show line numbers
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

set ignorecase
set smartcase           " ignore case if search pattern is all lowercase
set nohlsearch            " highlights search results
set noincsearch         

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
nmap ,w :w<CR>

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
nmap <leader>n :set number!<CR>

" search for word under cursor
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>a :Ack! '\b<c-r><c-w>\b'<CR>


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

nmap <leader>2 :setlocal ts=2 sts=2 sw=2 et<CR>
nmap <leader>7 :set tw=79<CR>

nmap <leader>t :tabe<CR>
nmap <leader>rc :tabe $MYVIMRC<CR>
nmap <leader>rs :so $MYVIMRC<CR>

" Filetypes mapped to leader
nmap <leader>fj :setf jinja.html<CR>

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

    au FileType scss setlocal ts=2 sts=2 sw=2 et
    au FileType less setlocal ts=2 sts=2 sw=2 et
    au FileType css setlocal ts=2 sts=2 sw=2 et

    au FileType html setlocal ts=2 sts=2 sw=2 et
    au FileType htmldjango setlocal ts=2 sts=2 sw=2 et

    au FileType wiki setlocal tw=79

    " Remove trailing whitespaces for py, js
    au BufWritePre *.py :call <SID>StripTrailingWhitespaces()
    au BufEnter * let &titlestring = expand("%")

    au BufNewFile,BufRead *.rss,*.atom setfiletype xml
    au! BufRead,BufNewFile *.json setfiletype json

    au BufNewFile,BufRead *.tsx set filetype=typescriptreact.typescript
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
nmap <C-g> :Git<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Git blame<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gw :Gwrite<CR>

" ctrlp
set wildignore+=*/tmp/*,*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ },
    \ 'fallback': 'find %s -type f'
    \ }
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_exclude = '/tmp/.*\|\.git/.*'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'crap$|site_media$|\/tmp$',
  \ 'file': '\.pyc$\|\.min.js$|\.jpg$|\.png$|\.gif$',
  \ }

nnoremap <leader>8 :SyntasticCheck<CR>
nnoremap <leader>9 :SyntasticToggleMode<CR>

" Nerd commenter
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" vim surround django mappings
let g:surround_{char2nr("s")} = "{% static \"\r\" %}"
let g:surround_{char2nr("t")} = "{% trans \"\r\" %}"
let g:surround_{char2nr("b")} = "{% block %}\r{% endblock %}"
let g:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:jsx_ext_required = 0

" Emmet
let user_emmet_expandabbr_key = '<C-e>'

if filereadable(".lvimrc")
    source .lvimrc
endif

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.vim/UltiSnips']

nmap <leader>= :s/=/ = /g<CR>
nmap ,d "=strftime('= %A, %d %b %Y =')<C-M>p
map ,c :call VimuxRunCommand('gcc ' . bufname("%") . ' && ./a.out')<CR>
map ,t :call VimuxRunCommand('yarn test ' . bufname("%"))<CR>
map ,r :call VimuxRunCommand('go run ' . bufname("%"))<CR>
map <leader>m :call VimuxRunLastCommand()<CR>

hi MatchWord ctermfg=red guifg=blue

"let g:netrw_altv = 1
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_liststyle = 3
"let g:netrw_winsize = -28

" vimwiki settings
nmap <Leader>1 <Plug>VimwikiMakeDiaryNote <bar> :Goyo<CR>
nmap <Leader>2 <Plug>VimwikiMakeYesterdayDiaryNote <bar> :Goyo<CR>

" Ale
" ===
let g:ale_fix_on_save = 1 
let g:ale_fixers = {
\   'python': ['black'],
\   'css': ['prettier'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier']
\}
let g:ale_linters = {
\    'python': ['flake8', 'pylint'],
\    'java': ['javac'],
\    'css': ['prettier'],
\    'scss': ['prettier'],
\    'javascript': ['eslint', 'prettier'],
\    'typescript': ['eslint', 'prettier']
\}
let g:ale_java_javac_executable = 'javac-algs4'
let g:ale_javascript_prettier_executable = 'yarn prettier'
" ale gutter related
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

nmap ]a :ALENextWrap<CR>
nmap [a :ALEPreviousWrap<CR>

let g:gutentags_ctags_exclude = ['node_modules', 'build', '.mypy_cache']

"alphsubs ---------------------- {{{
    execute "digraphs ks " . 0x2096 
    execute "digraphs as " . 0x2090
    execute "digraphs es " . 0x2091
    execute "digraphs hs " . 0x2095
    execute "digraphs is " . 0x1D62
    execute "digraphs ks " . 0x2096
    execute "digraphs ls " . 0x2097
    execute "digraphs ms " . 0x2098
    execute "digraphs ns " . 0x2099
    execute "digraphs os " . 0x2092
    execute "digraphs ps " . 0x209A
    execute "digraphs rs " . 0x1D63
    execute "digraphs ss " . 0x209B
    execute "digraphs ts " . 0x209C
    execute "digraphs us " . 0x1D64
    execute "digraphs vs " . 0x1D65
    execute "digraphs xs " . 0x2093
"}}}
"
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:python_host_prog = '/Users/dheerajsayala/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/dheerajsayala/.pyenv/versions/neovim3/bin/python'

nmap <leader>gi :vs %:p:h/index.tsx<CR>
nmap <leader>gt :vs %:p:h/index.test.tsx<CR>
nmap <leader>gs :vs %:p:h/style.js<CR>
nmap <leader>' s’<esc>

set isfname+=@-@

" let g:copilot_filetypes = {
" \   'javascript': v:false,
" \ }
