" Configuration for Vim

" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bkad/CamelCaseMotion'
call vundle#end()
filetype plugin indent on

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
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
set laststatus=2                " Show Status Line Always

" Whitespace and syntax
syntax on
set textwidth=78
set tabstop=4
set shiftwidth=4
" run `:set list` to show whitespace
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set bg=dark                     " Vi colors break if they don't know your background

" Scrolling
set scrolloff=3                 " Keep minimal number of lines above/below cursor
set sidescroll=3                " Scroll sideways 3 characters at a time
" Unset mouse support as it makes tmux + vi do all sorts of crazy right now.
"set mouse=a                     " Set mouse mode in all

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
set viminfo="NONE"              " Don't store history in a long-lived file
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
set wrap                        " Wrap text

set whichwrap+=<,>,h,l,[,]      " Have h, l wrap lines
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Split Screen
set splitright                  " Place new window on the right
nmap <C-w>e :vsplit<CR>
nmap <C-w>w :split<CR>
autocmd filetype netrw noremap <buffer> <C-w>e :vsplit<CR>
autocmd filetype netrw noremap <buffer> <C-w>w :split<CR>

" Tab management
nmap <C-t>t :tabnew .<CR>
nmap <C-t>c :tabclose<CR>
nmap <C-t>l :tabnext<CR>
nmap <C-t>h :tabprevious<CR>
nmap tl :tabnext<CR>
nmap th :tabprevious<CR>
autocmd filetype netrw noremap <buffer> <C-t>l :tabnext<CR>
autocmd filetype netrw noremap <buffer> <C-t>h :tabprev<CR>
autocmd filetype netrw noremap <buffer> tl :tabnext<CR>
autocmd filetype netrw noremap <buffer> th :tabprev<CR>

" Modifier Keys
set backspace=indent,eol,start
" Use semicolon for colon
nmap ; :
vmap ; :

" Text Navigation
" Disable the arrow keys for your own good
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Extending the power of the home row nav
nnoremap J <C-D>
nnoremap K <C-U>
let g:go_doc_keywordprg_enabled = 0 " Turn off vim-go's K so the above works
" Allow recursive mapping to get camelcase
nmap H b
nmap L w

" Merge lines with +
noremap + J

" Have a corresponding w/e combo
vmap e b
vmap E B
nmap e b
nmap E B

" Double keys for esc, save, exit
imap ii <Esc>
vmap ii <Esc>
nmap ss :w<CR>
nmap qq :wq<CR>
nmap cc :q!<CR>
" So cc works on directory listings
autocmd filetype netrw noremap <buffer> cc :q!<CR>

" Insert new lines
map <S-Enter> O<Esc>j
map <CR> o<Esc>k

" Home/End A E beginning and end of line edits
noremap A I
noremap E A
nmap <C-a> <Home>
nmap <C-e> <End>
