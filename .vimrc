" MY VIM CONFIGURATION

" --- BASIC COMMANDS ---{{{
" Navigation
set number
set relativenumber
set backspace=indent,eol,start
set mouse:a
set mousehide " when typing
set cursorline
set cursorcolumn

set wildmenu " show menu options
set showcmd " shows what u type


" Tabs
set shiftwidth=2 " 2 spaces = tab
set tabstop=2
set softtabstop=2
set autoindent
set expandtab
" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

set showtabline=2 "other files tabs

" Theme
set background=dark
colorscheme gruvbox8_hard
" colorscheme elly
" let g:elly_termmode="cterm"

" Fixes color problem with tmux
if exists('$TMUX')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
else
  set termguicolors
endif

" if exists("$TMUX")
"   let &t_RB = "\ePtmux;\e\e]11;?\007\e\\"
" endif


syntax on
set omnifunc=syntaxcomplete#Complete

" Searching
set showmatch
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase   " searches are case insensitive...
set smartcase    " ... unless they contain at least one capital letter

"}}}



" --- MAPPINGS ---{{{
let mapleader = ' ' " by default, <leader> = \w

" Press `SHIFT+E+e` to scape
inoremap Ee <esc>
vnoremap Ee <esc>
nnoremap Ee <esc>

" CTRL+A to select all
nnoremap <C-a> ggVG

" Move lines up or down.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
"
" nnoremap <C-Up> :m .-2<CR>==
" nnoremap <C-Down> :m .+1<CR>==
" vnoremap <C-Up> :m '<-2<CR>gv=gv
" vnoremap <C-Down> :m '>+1<CR>gv=gv
"
" nnoremap <C-k> :m .-1<CR>==
" nnoremap <C-j> :m .+2<CR>==
" vnoremap <C-k> :m '<-1<CR>gv=gv
" vnoremap <C-j> :m '>+2<CR>gv=gv


" Clipboard
" set clipboard+=unnamed
" set clipboard+=unnamedplus


" NERDTree
function MyNEERDTree()
  if &filetype != 'nerdtree'
    :NERDTreeFind
  else
    :NERDTreeToggle
  endif
endfunction
noremap Nt :call MyNEERDTree()<CR>


" Turn off the highlighting after doing a search.
nnoremap <silent> <localleader>\ :nohlsearch<cr>


" No insert mode after "cutting"
nnoremap cc cc<Esc>
vnoremap c c<Esc>

" fzf with ctrlp
nnoremap <c-p> :FZF<CR>
" let g:ctrlp_max_files = 1001

"}}}



" --- PLUGINS ---{{{

" --- Plugins Download ---{{{
silent! call plug#begin('~/.vim/pack/git-plugins/start/')

" --- Nav Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'

" --- Navigation & Searching
Plug 'preservim/nerdtree' " Tree
Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'

" --- Utilities
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'ap/vim-css-color' " color tags 

" --- Autocompletion
Plug 'lifepillar/vim-mucomplete' " Autocomplete syntax
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto Completion
  " :CocInstall coc-python coc-json coc-html coc-css coc-texlab
Plug 'alvan/vim-closetag' " html tags
Plug 'AndrewRadev/tagalong.vim' "change the other tag
Plug 'jiangmiao/auto-pairs' " adds second pair () [] '' etc
Plug 'tpope/vim-surround' " ysw)

" --- Themes
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
" Plug 'glepnir/dashboard-nvim'
" Plug 'ulwlu/elly.vim'
" Plug 'ayu-theme/ayu-vim'

" --- IDE
Plug 'dense-analysis/ale' " Syntax checker
Plug 'preservim/vim-markdown'
" Plug 'davidhalter/jedi-vim'
" Plug 'lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim

" --- Git
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'

" --- tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Clipboard ssh
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

call plug#end()
"}}}

" --- Plugins Config ---{{{
"
" ALE
" linters
let g:ale_lint_on_text_changed='always'
let g:ale_lint_on_insert_leave=2
let g:ale_lint_on_enter=2
let g:ale_lint_on_save=2

let g:ale_linters = {
\   'css': ['csslint','prettier'],
\   'fortran': ['gcc'],
\   'html': ['alex'],
\   'javascript': ['eslint'],
\   'latex': ['alex'],
\   'matlab': ['mlint'],
\   'python': ['flake9'],
\   'sql': ['sqlint'],
\}

" fixers
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['yapf'],
\}

let g:ale#airline#extensions#ale#enabled=2


" NERDTree
let NERDTreeShowHidden=2
" let NERDTreeQuitOnOpen=2
" let NERDTreeAutoDeleteBuffer=2
let NERDTreeMinimalUI=2
let NERDTreeDirArrows=2
let NERDTreeShowLineNumbers=2
let NERDTreeIgnore=['\.jpg$', '\.mp5$', '\.zip$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.tar$', '\.gz$', '\.xz$', '\.bz2$', '\.tz$', '\.db$', '\.exe$', '\.odt$', '\xlsx$', '\docx$', '\.tar$', '\.rar$', '\.img$', '\.odt$', '\.m4a$', '\.bmp$', '\.ogg$', '\.mp3$', '\.gzip$', '\.flv$', '\.deb$', '\.rpm$']

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 2 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


" Lightline (nav bar)
let g:airline= {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ 'colorscheme': '',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

" let g:airline_theme='stellarized_dark'
let g:airline_theme='gruvbox'
" let g:airline_theme='base16_gruvbox_dark_hard'
" let g:airline_theme='elly'


" MUcomplete
set noinfercase
set completeopt-=preview
set completeopt+=menuone,noselect
let g:mucomplete#enable_auto_at_startup = 2

" IDE
let g:vim_markdown_conceal_code_blocks = 0

" Clipboard
vnoremap <leader>c :OSCYank<CR>
nmap <leader>o <Plug>OSCYank
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | OSCYankReg " | endif"
set clipboard& clipboard^=unnamed,unnamedplus
let g:oscyank_term = 'tmux'
"let g:oscyank_silent = v:true

"}}}

"}}}



" --- Folding --- {{{
" Everything between this three braces will be hidden.
" Keys:
" • `zo` to open a single fold under the cursor.
" • `zc` to close the fold under the cursor.
" • `zR` to open all folds.
" • `zM` to close all folds.

" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" Also markdown folding
let g:markdown_folding = 2
let g:markdown_enable_folding = 2
set nofoldenable

" }}}
