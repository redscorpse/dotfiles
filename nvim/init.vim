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
set showcmd " shows what you type


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
colorscheme codedark
" colorscheme myGruvbox
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


" syntax on
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


" Move lines up or down.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv


" CTRL+A to select all
nnoremap <C-a> ggVG
" CTRL+w -> :w
nnoremap <C-w> :w<CR>
" CTRL+s -> :wq
nnoremap <C-s> :wq<CR>
" CTRL+q ->
nnoremap <C-q> :q<CR>

" Clipboard
set clipboard^=unnamed,unnamedplus
" CTRL+C -> copy to clipboard
vnoremap <C-c> "+y
nnoremap <C-c> "+y
" CTRL+x -> cut to clipboard
vnoremap <C-x> "+d
nnoremap <C-x> "+d
" CTRL+v -> paste to clipboard
nnoremap <C-v> "+p
vnoremap <C-v> "+p
nnoremap <C-v> "+P
vnoremap <C-v> "+P


" Turn off the highlighting after doing a search.
nnoremap <silent> <localleader>\ :nohlsearch<cr>


" No insert mode after "cutting"
nnoremap cc cc<Esc>
vnoremap c c<Esc>

" Integrated terminal
:nmap <C-t> :split \| wincmd J \| resize 5 \| terminal<CR>


"}}}


" --- PLUGINS ---{{{

" --- Plugins Download ---{{{
silent! call plug#begin('~/.config/nvim/pack/git-plugins/start/')

" --- Nav Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'

" --- Navigation & Searching
Plug 'preservim/nerdtree' " Tree
Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'zhenyangze/vim-bitoai'


" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-treesitter/nvim-treesitter'


" --- Utilities
Plug 'yggdroot/indentline'
" Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'preservim/nerdcommenter'
Plug 'ap/vim-css-color' " color tags 

" --- Autocompletion
"Plug 'lifepillar/vim-mucomplete'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
":CocInstall coc-sh coc-html coc-css coc-texlab coc-pyright coc-json coc-tsserver coc-clangd
Plug 'alvan/vim-closetag' " html tags
Plug 'AndrewRadev/tagalong.vim' "change the other tag
Plug 'jiangmiao/auto-pairs' " adds second pair () [] '' etc
Plug 'tpope/vim-surround' " ysw)

" --- Themes
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
" Plug 'rafi/awesome-vim-colorschemes' "Retro Scheme
" Plug 'shiyanhui/elly.vim'
" Plug 'rebelot/kanagawa.nvim'
" Plug 'glepnir/dashboard-nvim'
Plug 'ryanoasis/vim-devicons'

" --- IDE
" Plug 'dense-analysis/ale' " Syntax checker
Plug 'preservim/vim-markdown'
" Plug 'davidhalter/jedi-vim'
" Plug 'lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim

" --- Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-repeat'

" --- tmux integration
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
"}}}

" --- Plugins Config ---{{{

" so ~/.config/nvim/dashboard.lua
" let g:indentLine_fileTypeExclude = ['dashboard']


" fzf with ctrlp
nnoremap <c-p> :FZF<CR>
" let g:ctrlp_max_files = 1001
" let g:ctrlp_working_path_mode = 'ra'


" Nerd Commenter, add/remove spaces
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1


" NERDTree
function MyNEERDTree()
  if &filetype != 'nerdtree'
    if bufwinnr("NERD_tree") != -1
      :NERDTreeClose
    else
      :NERDTreeFind
    endif
  else
    :NERDTreeToggle
  endif
endfunction
noremap Nt :call MyNEERDTree()<CR>

let NERDTreeShowHidden=0
" let NERDTreeQuitOnOpen=2
" let NERDTreeAutoDeleteBuffer=2
let NERDTreeMinimalUI=2
let NERDTreeDirArrows=2
let NERDTreeShowLineNumbers=0
let NERDTreeIgnore=['\.jpg$', '\.mp5$', '\.zip$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.tar$', '\.gz$', '\.xz$', '\.bz2$', '\.tz$', '\.db$', '\.exe$', '\.odt$', '\xlsx$', '\docx$', '\.tar$', '\.rar$', '\.img$', '\.odt$', '\.m4a$', '\.bmp$', '\.ogg$', '\.mp3$', '\.gzip$', '\.flv$', '\.deb$', '\.rpm$']

if &columns > 120
  " Start NERDTree and put the cursor back in the other window.
  autocmd VimEnter * :NERDTreeFind | wincmd p
endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" VimDevicons
let g:webdevicons_enable = 1
set encoding=UTF8
set guifont=JetBrainsMono_11
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
" change the default dictionary mappings for file extension matches
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['f90'] = '󱈚'


" Lightline (nav bar)
let g:airline= {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['filetype', 'percent', 'lineinfo'], ['gitbranch']]
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

let g:airline_powerline_fonts = 1
" let g:airline_theme='gruvbox'
" let g:airline_theme='deus'


" MUcomplete
" set noinfercase
" set completeopt-=preview
" set completeopt+=menuone,noselect
" let g:mucomplete#enable_auto_at_startup = 2


" Coc
<<<<<<< HEAD
let g:coc_disable_startup_warning = 1
=======
"let g:coc_disable_startup_warning = 1
>>>>>>> 2e2e346 (update files)
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" IDE
let g:vim_markdown_conceal_code_blocks = 0
autocmd FileType json set conceallevel=0
autocmd FileType markdown set conceallevel=0
" line 110: ~/.config/nvim/pack/git-plugins/start/indentline/after/plugin/indentLine.vim


" Bito
" will show in buffers list
let g:bito_buffer_name_prefix = get(g:, 'bito_buffer_name_prefix', 'bito_history_')

" if your bito cli is not sys command, you should change the bito path
let g:vim_bito_path = get(g:, 'vim_bito_path', "/usr/bin/bito")

" can change all the result of boti ,like: "Please translate the comment into chinses", "Please write the comment in chinses
let g:vim_bito_prompt_append = get(g:, 'vim_bito_prompt_append', "")


"}}}

"}}}


" --- Folding --- {{{
" Everything between this three braces will be hidden.
" Keys:
" • `zo` to open a single fold under the cursor.
" • `zc` to close the fold under the cursor.
" • `zR` to open all folds.
" • `zM` to close all folds.

" Unfolded on startup
set nofoldenable

" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim set foldenable
augroup END


" Also markdown folding
let g:markdown_folding = 2
let g:markdown_enable_folding = 2

" }}}

