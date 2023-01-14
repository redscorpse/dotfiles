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
" colorscheme codedark
colorscheme myGruvbox
" let g:gruvbox_contrast_dark = "hard"
highlight Normal ctermbg=NONE
set laststatus=2
set noshowmode

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
nnoremap \ :nohlsearch<cr>
nnoremap <Esc> :nohlsearch<cr>


" No insert mode after "cutting"
nnoremap cc cc<Esc>
vnoremap c c<Esc>

" fzf with ctrlp
nnoremap <c-p> :FZF<CR>
" let g:ctrlp_max_files = 1001
" let g:ctrlp_working_path_mode = 'ra'

"}}}



" --- PLUGINS ---{{{

" --- Plugins Download ---{{{
silent! call plug#begin('~/.config/nvim/pack/git-plugins/start/')

" --- Nav Bar
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'

" --- Navigation & Searching
Plug 'preservim/nerdtree' " Tree
Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
"Plug 'ctrlpvim/ctrlp.vim'

" --- Utilities
Plug 'yggdroot/indentline'
Plug 'preservim/nerdcommenter'
Plug 'ap/vim-css-color' " color tags 

" --- Autocompletion
"Plug 'lifepillar/vim-mucomplete'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
":CocInstall coc-sh coc-html coc-css coc-texlab coc-pyright coc-json
Plug 'alvan/vim-closetag' " html tags
Plug 'AndrewRadev/tagalong.vim' "change the other tag
Plug 'jiangmiao/auto-pairs' " adds second pair () [] '' etc
Plug 'tpope/vim-surround' " ysw)

" --- Themes
Plug 'morhetz/gruvbox'
"Plug 'rafi/awesome-vim-colorschemes' "Retro Scheme
" Plug 'glepnir/dashboard-nvim'
Plug 'shiyanhui/elly.vim'
Plug 'tomasiser/vim-code-dark'

" --- IDE
"Plug 'dense-analysis/ale' " Syntax checker
Plug 'preservim/vim-markdown'
" Plug 'davidhalter/jedi-vim'
" Plug 'lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim

" --- Git
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'

" --- tmux integration
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
"}}}

" --- Plugins Config ---{{{

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

" Nerd Commenter, add/remove spaces
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

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

" let g:airline_theme='gruvbox'


" MUcomplete
" set noinfercase
" set completeopt-=preview
" set completeopt+=menuone,noselect
" let g:mucomplete#enable_auto_at_startup = 2


" IDE
let g:vim_markdown_conceal_code_blocks = 0


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
