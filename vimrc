set nocompatible
filetype off

" Vundle
" ======================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" General
" ======================================================================
filetype plugin indent on
set background=light

syntax on

set guicursor+=n-v-c:blinkon0
set guicursor+=i-ci:ver25-blinkwait500-blinkon700-blinkoff400

set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=longest,menuone,preview
set encoding=utf-8
set hidden
set history=1000
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·
set showbreak=↪

set number

" Fix backups
set undodir=~/.vim/tmp/undo//     " undo files
set undofile
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile
set shortmess=atI

" Disable the macvim toolbar
set guioptions-=T

"Disable the scrollbars for NERDTree
set guioptions-=r
set guioptions-=L

set notimeout
set ttimeout
set ttimeoutlen=10

au BufNewFile * set noeol
set ruler
if executable('/bin/zsh')
  set shell=/bin/zsh
endif
set showcmd

" Project-local .vimrc files
set exrc
set secure

set matchtime=2

set autoindent
set tabstop=2
set softtabstop=2
set textwidth=79
set shiftwidth=2
set expandtab
set wrap
set formatoptions=qrn1
set colorcolumn=-6,+1

set viminfo^=!

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu

set mouse=a                      " Support for mouse in terminal


if isdirectory(expand('~/Dropbox/Text'))
  cd ~/Dropbox/Text
endif

" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vimrc

" Set 5 lines to the cursor - when moving vertically
set scrolloff=5

" Break lines intelligently when wrapping
set linebreak
set display+=lastline

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

" Trailing whitespace
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Folding
set foldmethod=syntax
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}



" Wrap git commit messages
autocmd FileType gitcommit set tw=68 spell

if has('gui_running')
  set columns=71
  set lines=50

  set guifont=Consolas:h20
  set guioptions-=T               "kill toolbar
  set guioptions-=m               "kill menu
  set guioptions-=r               "kill right scrollbar
  set guioptions-=l               "kill left scrollbar
  set guioptions-=L               "kill left scrollbar with multiple buffers
endif

set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch

" Ruby
autocmd FileType ruby,eruby,yaml set textwidth=80 autoindent shiftwidth=2 softtabstop=2 expandtab
autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" HTML
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" CoffeeScript
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.js setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab foldmethod=indent nofoldenable

" Make
au FileType make     set noexpandtab

" Bindings
" ======================================================================

let mapleader = ","
let maplocalleader = "\\"

" No arrow keys
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
" nnoremap <leader>po "*p

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" Easy toggling modes
nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>nn :set invnumber<CR>
"nmap <silent> <leader>pp :set invpaste<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

" Source current line
vnoremap <leader>L y:execute @@<cr>
" Source visual selection
nnoremap <leader>L ^vg_y:execute @@<cr>

" Fast saving
nmap <leader>w :w!<cr>
" Fast saving and closing current buffer without closing windows displaying the
" buffer
nmap <leader>wq :w!<cr>:Bclose<cr>

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Sane regexes
nnoremap / /\v
vnoremap / /\v

" Don't jump when using * for search
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Highlight word
nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

map <leader>q :Bclose!<cr>
map <leader>m :CtrlPMRU<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>w :w<cr>

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

" Quick editing
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>es :e ~/.vim/snippets/<cr>
nnoremap <leader>eg :e ~/.gitconfig<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>
nnoremap <leader>et :e ~/.tmux.conf<cr>

" Vim
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" Gist
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>

"nnoremap <silent> <Leader>bd :Bclose<CR>

" Ctrl-Tab for window navigation
nnoremap <c-tab> <c-w>w

" Usually ' jumps to the beginning of the line and ` to the exact character,
" but it makes more sense to swap them.
nnoremap ' `
nnoremap ` '

" Modes
" ------------------------------------------------

" Ack
nnoremap <leader>a :Ack!<space>

" NERDTree
nmap <leader>o :NERDTreeToggle<cr>
nmap <leader>i :NERDTreeFind<cr>

" Yank Ring
nmap <leader>y :YRShow<cr>

" vimux
map <Leader>rp :PromptVimTmuxCommand<CR>
map <Leader>rl :RunLastVimTmuxCommand<CR>
vmap <LocalLeader>rs "vy :call RunVimTmuxCommand(@v . "\n", 0)<CR>
nmap <LocalLeader>rs vip<LocalLeader>rs<CR>

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" Fugitive (Git)
nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
:vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

let g:tagbar_type_scss = {
	\ 'ctagstype' : 'scss',
	\ 'kinds' : [
		\ 'd:definition',
		\ 'm:mixin'
	\ ]
\ }

let g:Powerline_theme='rads'
let g:Powerline_colorscheme='skwp'

Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'
Bundle 'scrooloose/nerdtree'

Bundle 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '~/.vim/tmp'

Bundle 'michaeljsmith/vim-indent-object'
let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map='<leader>p'

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1

Bundle 'zaiste/tmux.vim'
Bundle 'benmills/vimux'
Bundle 'majutsushi/tagbar'
Bundle 'gregsexton/gitv'
Bundle 'tomtom/tcomment_vim'

Bundle 'tpope/vim-fugitive'

Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

Bundle 'kana/vim-textobj-user'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kchmck/vim-coffee-script'
au BufRead,BufNewFile *.coffee set filetype=coffee

Bundle 'Spaceghost/vim-matchit'
Bundle 'embear/vim-localvimrc'
let g:localvimrc_name='.vimrc.local'
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0

Bundle 'altercation/vim-colors-solarized'
colorscheme solarized

" showmarks
"Bundle 'vim-scripts/ShowMarks'
"let g:showmarks_enable=1
"hi! link ShowMarksHLl LineNr
"hi! link ShowMarksHLu LineNr
"hi! link ShowMarksHLo LineNr
"hi! link ShowMarksHLm LineNr
"map ,kt <Plug>ShowmarksShowMarksToggle
"map ,ko <Plug>ShowmarksShowMarksOn
"map ,kh <Plug>ShowmarksClearMark
"map ,ka <Plug>ShowmarksClearAll
"map ,km <Plug>ShowmarksPlaceMark

Bundle 'vim-scripts/AutoComplPop'

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

let g:LustyJugglerSuppressRubyWarning=1
let g:LustyJugglerAltTabMode=1
let g:LustyJugglerShowKeys='a' " show a/s/d/f keys 
let g:LustyJugglerDefaultMappings=0
map <leader>j :LustyJuggler<cr>

" FIXME
syn keyword myTodo TODO FIXME XXX REVIEW HACK OPTIMIZE contained
syn keyword coffeeTodo TODO FIXME XXX REVIEW HACK OPTIMIZE contained
hi def link myTodo Todo
