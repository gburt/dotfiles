" Configuration for Vim

set viminfo="NONE"
syntax on
set tw=72


" File Handling
set autoread                    " Reload buffer when file modified externally
set clipboard=unnamed           " Yank and paste using system clipboard
set encoding=utf-8              " Default character encoding
set hidden                      " Do not unload buffers that get hidden
set noswapfile                  " Do not use a swap file for buffers
set nowritebackup               " No backup files before overwriting file
set nobackup                    " No backup files

" UI Settings
set title                       " Let VI set the terminal title
set titlelen=85                 " Cap the length of terminal title
set number                      " Line numbers on left
set showcmd                     " Show command line at bottom of screen
set cmdheight=1                 " Command Line Height
" Skinny cursor when you are in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2                " Show Status Line Always

" Scrolling
set scrolloff=3                 " Keep minimal number of lines above/below cursor
set sidescroll=3                " Scroll sideways 3 characters at a time

" Errors
set noerrorbells                " No beeping
set novisualbell                " No visual flash
set t_vb=                       " Reset the visual bell code to nothing

" Search Settings
set ignorecase                  " ignore case when pattern matching
set smartcase                   " only if all characters are lower case
set incsearch                   " highlight matches while typing search
set hlsearch                    " keep previous search highlighted
" Turn off highlighting of previous search
noremap <C-n> :nohlsearch<CR>
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" History
set history=1000                " How many lines of history to keep
set undolevels=1000             " Max number of undos
" Shift U redos
nmap <S-u> <C-r>

" Autocomplete File Settings
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set wildignore+=*.so,*.swp      " Ignore swap files
set wildignore+=*.zip,*.tar.gz  " Ignore compressed archives
set wildignore+=*.git,*.svn     " Ignore code repos

" Line Wrapping
set nowrap                      " Don't wrap text
set whichwrap+=<,>,h,l,[,]      " Have h, l wrap lines
set textwidth=78                " Set the text width
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Split Screen
set splitright                  " Place new window on the right
nmap nm :vsplit<CR>
nmap nj :split<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Tab management
nmap tt :tabnew .<CR>
nmap tk :tabnext<CR>
nmap tj :tabprevious<CR>

" Syntax Highlighting
syntax on                       " Turn on syntax highlighting

" Modifier Keys
set backspace=indent,eol,start
let mapleader = ","             " Setting leader
" Use semicolon for colon
nmap ; :
vmap ; :

" Text Navigation
" Disable the arrow keys for your own good
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Extending the power of the home row nav
nmap J <C-D>
nmap K <C-U>
nmap H b
nmap L w

" Merge lines with +
noremap + J

" Have a corresponding w/e combo
vmap e b
vmap E B
nmap e b
nmap E B

" Use ii for exit
map ii <Esc>
imap ii <Esc>
cmap ii <ESC>
nmap ss :w<CR>
cmap w!! w !sudo tee >/dev/null %
nmap SS :w !sudo tee % >/dev/null<CR>
nmap qq :wq<CR>
nmap QQ :wqall<CR>
nmap cc :q!<CR>

" Insert new lines
map <S-Enter> O<Esc>j
map <CR> o<Esc>k

" A E beginning and end of line edits
noremap A I
noremap E A
