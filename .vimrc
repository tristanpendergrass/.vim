execute pathogen#infect()

set number
set nocompatible

let mapleader = " "

set splitright
set guifont=Inconsolata:h14
set tabstop=2
set shiftwidth=2
set expandtab
set showcmd
set incsearch
set noeol
set fileformats+=dos
set noro

" tab width should be different for some file types
autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 expandtab

" these make it so that our text search will only be case sensitive if it
" includes a capital letter. The ignore case is a prereq for smartcase
set ignorecase
set smartcase

" type :R to reload the .vimrc
command! R source $MYVIMRC

" because no one uses the semicolon but I often use colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" for adding lines without entering insert mode
nnoremap <CR> o<Esc>k

" map for opening nerdTree, with two enters required to open it for some reason
nnoremap <Leader>n :NERDTree<CR><CR>

" change the default width of the NERDTree window
let g:NERDTreeWinSize = 44 

" make vim-markdown not fold lines
let g:vim_markdown_folding_disabled=1

" enable autoformating of rust files on save
let g:rustfmt_autosave = 1

" enable jsx syntax highlighting in .js files as well as .jsx
let g:jsx_ext_required = 0

" change indenting character
" I like it off for now
"let g:indentLine_char = '︙'

"NERDTrees File highlighting
"function! NERDTreeHighlightFile(extension, fg)
 "exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
 "exec 'autocmd filetype nerdtree highlight ' . a:extension . ' ctermfg=' . a:fg . ' guifg=' . a:fg
"endfunction
"call NERDTreeHighlightFile('js', 'green')


" for moving between buffers easily
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" make moving between lines that are wrapped more intuitive
nnoremap j gj
nnoremap k gk

" syntax highlighting
syntax enable

filetype plugin indent on

" color scheme goes here
"set t_co=256
set background=dark

"colorscheme distinguished
colorscheme solarized

"highlight ColorColumn ctermbg=235 guibg=#EAEAC5
highlight ColorColumn ctermbg=235 guibg=#1A334C
let &colorcolumn=100

" settings for vim-javascript. I was trying to prevent folding but js files
" still fold...hopefully we can fix that sometime
let javascript_enable_domhtmlcss=1
let b:javascript_fold=0
let javascript_ignore_javaScriptdoc=1

" computers rarely crash these days and these files screw up our git and VS.
" We might try putting the files in a different directory instead
set nowritebackup
set nobackup

" easymotion allows us to jump to all places that could have been reached by
" (w in this case), and the bd- indicates we want to search backwards too.
nmap f <Plug>(easymotion-bd-w)
vmap f <Plug>(easymotion-bd-w)

" turn off highlighting
nnoremap <Leader>/ :noh<CR>

" Provides the autocomplete for brackets and single- and doublequote, as well
" as alowing you to 'type through' them.
inoremap <expr> {   strpart(getline('.'), col('.')-1, 1) == "\n" ? "{}\<Left>" : "{"
inoremap <expr> }   strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> (   strpart(getline('.'), col('.')-1, 1) == "\n" ? "()\<Left>" : "("
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> [   strpart(getline('.'), col('.')-1, 1) == "\n" ? "[]\<Left>" : "["
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> "  strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\""
inoremap <expr> '  strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "'"

" save and quit now on easy hotkeys
nnoremap s :wa<CR>
nnoremap q :q<CR>

" swapfiles mess up the build tool in VS so they gots to go
set noswapfile

" comment and uncomment a line
" nnoremap <Leader>[ ^i// <Esc>
" nnoremap <Leader>] ^3x

" remove gui from gvim
set guioptions-=m
set guioptions-=T

nnoremap <Leader>r :g/^/m0<CR>:noh<CR>

" quick ninja editing of vimrc. type :source $MYVIMRC to make changes take
" effect immediately
:cnoremap vimrc :sp<CR>:e $MYVIMRC<CR>

" makes it so that when we move to next search it centers on line it found
nnoremap n nzz
nnoremap N nzz

" a must have to not break our fingers reaching for escape or ctrl-[ all the
" time
inoremap jk <Esc>
inoremap JK <Esc>

" for scrolling up and down quickly
nnoremap J 7j
nnoremap K 7k
vnoremap J 7j
vnoremap K 7k

" set width of tabs between the two common settings: 2 and 4
nnoremap <Leader>2 :set shiftwidth=2<CR>
nnoremap <Leader>4 :set shiftwidth=4<CR>

" align the properties of a json object when cursor is inside that object
nnoremap <Leader>t Vi{:Tab/:\zs<CR>

" type \ to bring the line below the cursor up to the end of the current
" line
nnoremap \ J

" source the vim nerdtree colors file
let $VIMHOME=expand('<sfile>:p:h')
source $VIMHOME/.vim/.vimrc_nerdtree_colors
