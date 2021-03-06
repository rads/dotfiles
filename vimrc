filetype off
call pathogen#infect()

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,build/**,*/node_modules/*

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set ruler                         " Show cursor position.

if exists('+undofile')            " Save undo state for each file
  set undofile
  set undodir=$HOME/.vim/tmp//,.
endif

set number

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set hl=l:IncSearch

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set smarttab
set autoindent

set mouse=a                      " Support for mouse in terminal

" Break lines intelligently when wrapping
set linebreak
set display+=lastline

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%=%-16(\ %l,%c-%v\ %)%P

set background=light
colorscheme solarized

set guicursor+=n-v-c:blinkon0
set guicursor+=i-ci:ver25-blinkwait500-blinkon700-blinkoff400

" let g:delimitMate_excluded_ft='txt,markdown'
let g:delimitMate_expand_space=1
let g:delimitMate_expand_cr=1
let g:yankring_history_dir='$HOME/.vim/tmp'
let g:local_vimrc='.vimrc.local'
let g:vimclojure#ParenRainbow=1
let g:vimclojure#WantNailgun=0
let g:ctrlp_map='<leader>p'
let g:ctrlp_working_path_mode=2
let g:ctrlp_dotfiles=0
let g:EasyMotion_mapping_b='_b'
let g:MarkdownPreviewTMP=$HOME.'/.vim/tmp/'
let g:vimroom_guibackground='#fdf6e2'
let g:vimroom_ctermbackground=8
let g:vimroom_width=60

let mapleader=","
let maplocalleader="\\"
set listchars=tab:>-,eol:$
set shortmess=atI

cd ~/t


" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Ctrl-Tab for window navigation
nnoremap <c-tab> <c-w>w

" Visual up and down rather than line-based
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" Usually ' jumps to the beginning of the line and ` to the exact character,
" but it makes more sense to swap them.
nnoremap ' `
nnoremap ` '

" Make Y yank to the end of the line, not the whole line
nnoremap Y y$

nnoremap <silent> <Leader>V :VimroomToggle

" Remove trailing whitespace
function! StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//e
    silent! %s/\($\n\s*\)\+\%$//e
    nohlsearch
    call winrestview(l:winview)
endfunction

nmap <silent> <leader>n :call StripTrailingWhite()<cr>

" Quickly edit and reload .vimrc
nmap <leader>ve :e $MYVIMRC<cr>
nmap <leader>vr :so $MYVIMRC<cr>

" Disable search highlighting
nmap <silent> <leader>/ :nohlsearch<cr>

" Fugitive
map <leader>gg :Git
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>

map <silent> <leader>o :NERDTreeToggle<cr>
map <leader>h :e ~/t/Home.md<cr>
map <leader>q :Kwbd<cr>
map <leader>m :CtrlPMRUFiles<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>x :CtrlP ~/t<cr>
map <leader>w :w<cr>

nmap <c-j> o<Esc>
nmap <c-k> O<Esc>

nmap SSA :wa<CR>:mksession! ~/sessions/
nmap SO :wa<CR>:so ~/sessions/

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

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

" Autocmds
au FileType make     set noexpandtab

hi ExtraWhitespace ctermbg=7 guibg=#eee8d5
function! Coding()
  if exists('+colorcolumn')
    setl colorcolumn=81
  endif
  syn match ExtraWhitespace /\s\+$\| \+\ze\t/
  setl cursorline
  " setl nowrap
endfunction

function Marked()
  let file = fnameescape(expand('%'))
  silent! exec "!open -a Marked " . file
endfunction

map <silent> <leader>r :call Marked()<cr>

au BufRead,BufNewFile *.txt set filetype=markdown
au BufRead,BufNewFile *.as set filetype=actionscript
au BufRead,BufNewFile *.cljs set filetype=clojure
au BufRead,BufNewFile * if index(['txt', 'markdown'],&ft) == -1|call Coding()|endif

au FileType markdown syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="\[\[" end="\]\]" keepend

au FileType java setl tabstop=4|setl shiftwidth=4
au FileType c setl tabstop=4|setl shiftwidth=4
au FileType markdown setl tabstop=4|setl shiftwidth=4
au FileType clojure nmap <buffer> o A<cr>|nmap <buffer> O I<cr><esc>ki

if filereadable(".vimrc.local")
  source .vimrc.local
endif
