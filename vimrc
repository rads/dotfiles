filetype off
silent! ruby require('rubygems')
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

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
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,build/**

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

"set number                        " Show line numbers.
set ruler                         " Show cursor position.

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

" Break lines intelligently when wrapping
set linebreak
set display+=lastline

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%=%-16(\ %l,%c-%v\ %)%P

colorscheme zenburn
set guicursor+=n-v-c:blinkon0
set guicursor+=i-ci:ver25-blinkwait500-blinkon700-blinkoff400

let g:delimitMate_excluded_ft='txt,mkd'
let g:delimitMate_expand_space=1
let g:delimitMate_expand_cr=1
let g:yankring_history_dir='$HOME/.vim/tmp'
let g:local_vimrc='.vimrc.local'

let mapleader=","
set listchars=tab:>-,eol:$
set shortmess=atI

" Ctrl-Tab for window navigation
nnoremap <c-tab> <c-w>w

" Visual up and down rather than line-based
nnoremap <silent> j gj
nnoremap <silent> k gk

" Usually ' jumps to the beginning of the line and ` to the exact character,
" but it makes more sense to swap them.
nnoremap ' `
nnoremap ` '

nnoremap Y y$

" Remove trailing whitespace
nmap <silent> <leader>n my:%s/\s\+$//e<cr>'y:nohlsearch<cr>

" Quickly edit and reload .vimrc
nmap <leader>ve :e $MYVIMRC<cr>
nmap <leader>vr :so $MYVIMRC<cr>

" Disable search highlighting
nmap <silent> <leader>/ :nohlsearch<cr>

" Fugitive
map <leader>gg :Git
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>

map <silent> <leader>f :NERDTreeToggle<cr>

" Tab mappings.
" NOTE: These conflict with Command-T.
" map <leader>tt :tabnew<cr>
" map <leader>te :tabedit
" map <leader>tc :tabclose<cr>
" map <leader>to :tabonly<cr>
" map <leader>tn :tabnext<cr>
" map <leader>tp :tabprevious<cr>
" map <leader>tf :tabfirst<cr>
" map <leader>tl :tablast<cr>
" map <leader>tm :tabmove
" 
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
  set columns=80
  set lines=50

  set guifont=Consolas:h15
  set guioptions-=T               "kill toolbar
  set guioptions-=m               "kill menu
  set guioptions-=r               "kill right scrollbar
  set guioptions-=l               "kill left scrollbar
  set guioptions-=L               "kill left scrollbar with multiple buffers
endif

" Autocmds
au FileType make     set noexpandtab

  hi ExtraWhitespace ctermbg=darkred guibg=darkred
  hi ColorColumn guibg=#313633 ctermbg=236 cterm=none
  hi CursorLine guibg=#4f4f4f ctermbg=238 cterm=none
function! Coding()
  setl colorcolumn=81
  syn match ExtraWhitespace /\s\+$\| \+\ze\t/
  setl cursorline
endfunction

au BufRead,BufNewFile *.txt set filetype=mkd
au BufRead,BufNewFile * if index(['txt', 'mkd'],&ft) == -1|call Coding()|endif

if filereadable(".vimrc.local")
  source .vimrc.local
endif
