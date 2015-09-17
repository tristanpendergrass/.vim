execute pathogen#infect()

set number
set nocompatible

let mapleader = " "

set splitright
set guifont=Inconsolata:h12
set tabstop=2
set shiftwidth=2
set expandtab
set showcmd
set incsearch
set noeol
set fileformats+=dos
set noro

" these make it so that our text search will only be case sensitive if it
" includes a capital letter. The ignore case is a prereq for smartcase
set ignorecase
set smartcase

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
set t_co=256
set background=dark

"colorscheme distinguished
"colorscheme molokai
colorscheme solarized


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

highlight ColorColumn ctermbg=235 guibg=#1A334C
let &colorcolumn=80

" set width of tabs between the two common settings: 2 and 4
nnoremap <Leader>2 :set shiftwidth=2<CR>
nnoremap <Leader>4 :set shiftwidth=4<CR>

" align the properties of a json object when cursor is inside that object
nnoremap <Leader>t Vi{:Tab/:\zs<CR>

" type :join to bring the line below the cursor up to the end of the current
" line
:cnoremap join <Esc>J

" NERDTress File highlighting
" this can't go higher in the vimrc or something else overwrites its
" instructions. not sure how far down it has to be, but here works
function! NERDTreeHighlightFile(extension, fg)
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
 exec 'autocmd filetype nerdtree highlight ' . a:extension . ' guifg=' . a:fg
 "exec 'autocmd filetype nerdtree highlight ' . a:extension . ' guifg=' . a:fg . ' gui=bold'
endfunction
let white = '#ffffff'
let gold = '#ffd700'
let darkgoldenrod = '#b8860b'
let green = '#00CC00'
let brown = '#a5682a'
let silver = '#b0b0b0'
let purple = '#9370db'
let red = '#cc0000'
call NERDTreeHighlightFile('js', gold)
call NERDTreeHighlightFile('js.map', gold)
call NERDTreeHighlightFile('spec.js', darkgoldenrod)
call NERDTreeHighlightFile('html', green)
call NERDTreeHighlightFile('json', brown)
call NERDTreeHighlightFile('yml', brown)
call NERDTreeHighlightFile('txt', white)
call NERDTreeHighlightFile('md', white)
call NERDTreeHighlightFile('css', purple)
call NERDTreeHighlightFile('css.map', purple)
call NERDTreeHighlightFile('less', purple)
call NERDTreeHighlightFile('scss', purple)
call NERDTreeHighlightFile('sass', purple)
call NERDTreeHighlightFile('jpg', silver)
call NERDTreeHighlightFile('png', silver)
call NERDTreeHighlightFile('svg', silver)
call NERDTreeHighlightFile('ico', silver)
