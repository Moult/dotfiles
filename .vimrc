" Begin vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'myusuf3/numbers.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplcache'
Plugin 'spf13/PIV'
Plugin 'bling/vim-airline'
" Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
call vundle#end()
filetype plugin indent on

" Begin local config

" Make file tabbing case insensitive (because it's annoying with PSR-0)
set wic

" Disable spellchecking
set nospell

" line numbers
set number

" This makes the mouse work in Vim.
set mouse=a

" remove gui
set guioptions=&

" set font
set guifont=Inconsolata\ for\ Powerline\ 9
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
let g:bufferline_echo = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0
set timeoutlen=1000 ttimeoutlen=0

" set autoindent for auto indenting based on previous line.
set autoindent

" set smartindent so it will guess intelligently when programming.
set smartindent

" makes sure there is some sort of statusbar to show position
set ruler

" jump to search results _as you type it_ :)
set incsearch

" enable filetype detection
filetype on
filetype plugin on
filetype indent on

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" Do not make it jump to the matching bracket.
set nosm

" custom colorscheme
colorscheme wombat256

"""" set folding method to indentation.
"""set foldmethod=indent
"""set foldnestmax=10
"""set nofoldenable
"""set foldlevel=1

" change tabs to 4 spaces instead of 8
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Compile LaTeX files
nnoremap <Leader>ll :exe '!pdflatex ' . shellescape(expand('%'), 1)<CR>

" Compile Lilypond files
nnoremap <Leader>li :exe '!lilypond ' . shellescape(expand('%'), 1)<CR>

" Compiles .c files
nnoremap <Leader>cc :exe '!g++ ' . shellescape(expand('%'), 1)<CR>

" Sets the character limit per line to 80
set textwidth=80

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Used for surround.vim
let g:surround_loaded=1

" Set tabline to only show filenames
set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label =  bufname(buflist[winnr - 1])
  return fnamemodify(label, ":t")
endfunction

" Line wrapping is good.
set wrap

" Don't jump too far otherwise I forget where I am
set scroll=5

" Enable syntax highlighting
syntax on

" Enable neocomplcache for autocompleting keywords
let g:neocomplcache_enable_at_startup = 1

" Add tab cycle for neocomplcache
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Add support for mustache and stylus files
au BufNewFile,BufRead *.mustache set filetype=html
au BufNewFile,BufRead *.styl set filetype=css

" Map C-e to NERDTree
" map <C-e> :NERDTreeToggle<CR>

" Map C-e to netrw
map <C-e> :edit .<CR>

" Use tree style listing with netrw
let g:netrw_liststyle = 3

" Hide the netrw banner
let g:netrw_banner = 0

" Have NERDTree ignore unnecessary projcet files
" let NERDTreeIgnore = ['\.pyc$','__pycache__','.git','build','dist','.*\.egg-info']

" Map gt and gb to switch buffers (because tabs suck).
map gt :bnext<CR>
map gb :bprevious<CR>
map gl :buffers<CR>
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprev<CR>
map <C-t> :tabnew<CR>
nnoremap <Leader>w :tabclose<CR>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
