set nocompatible  "Remove vi compatibility
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle must manage Vundle
Bundle 'gamirik/vundle'

" tpope utilities
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'

" workflow
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" Languages and markup
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'zaiste/VimClojure'
Bundle 'nono/vim-handlebars'
Bundle 'pangloss/vim-javascript'

" Colors
Bundle 'BlakeWilliams/vim-tomorrow'

syntax on
set nohidden "Enable/Disabe unsaved buffers 
set backupcopy=yes "Keeps original creator code
set hlsearch "Highlights search
set noerrorbells "Obvious
set backspace=indent,eol,start "Adds intuitive backspacing
set fdc=1 "Fold column width
set backup " BACKUPS!
set noswapfile " NO MORE SWAPFILES!
set backupdir=~/.vim/backup "Custom location for backups
"set directory=~/.vim/tmp "Location for the swap file
set showmatch "Show matching paren/brace/bracket
set ignorecase "Ignore case in searches
set smarttab "Prevents tab/space issues
set autoindent smartindent "Use lines current indent level & interpret the next lines level
set undolevels=500 "More undo!
filetype indent on "Filetype specific indent
filetype plugin on "Filetype specific plugins
set wildmenu
set history=100		" keep 100 lines of command line history
set showcmd "Show command in the last line of the screen
set incsearch "Searches for text as entered
set laststatus=2 "Always show status line for powerline
set nowrap " Don't wrap lines

" Tab stuff!
set expandtab "Make spaces not tabs
set tabstop=4 "4 space tabs
set shiftwidth=4 "4 spaces when indented

" Plugin stuff
let NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=2

" Remaps!
let mapleader = " "

" Space to noh
nnoremap <leader><space> :noh<cr>

" v to select pasted lines
nnoremap <leader>v V`]

" a to split horizontally, S to split vertically
nnoremap <leader>s <C-w>s<C-w>j
nnoremap <leader>S <C-w>v<C-w>l

" Easy navigation of splits
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l


if has('mouse')
    set mouse=a "MOUSE!
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " If the first arg is a directory, open up nerdtree
    if isdirectory(argv(0))
        bd
        autocmd vimenter * exe "cd" argv(0)
        autocmd VimEnter * NERDTree
    endif


    " Language Specific Settings
    autocmd FileType text setlocal textwidth=78
    autocmd FileType markdown setlocal wrap
    autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType coffee     setlocal shiftwidth=2 tabstop=2
    autocmd FileType handlebars setlocal shiftwidth=2 tabstop=2
    autocmd FileType scss setlocal shiftwidth=2 tabstop=2
    autocmd FileType css  setlocal shiftwidth=2 tabstop=2
    autocmd FileType html setlocal shiftwidth=2 tabstop=2
    autocmd FileType eco  setlocal shiftwidth=2 tabstop=2

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
