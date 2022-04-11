" Menu language
set langmenu=en_US.UTF-8

" Default config
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Plugins
filetype plugin on
filetype indent on

" GUI mode extra settings
if has("gui_running")
    set lines=32 columns=120
    set guifont=Cascadia\ Mono:h11
    set guitablabel=%M\ %t
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
endif

" No tmp files
set nobackup
set nowritebackup
set noswapfile

" Text options
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac

" No bell
set vb
set t_vb=

" Enable mouse
set mouse=a
set mousemodel=extend

" Special key for more hotkeys
let mapleader = ","

" Backspace and navigation
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Spaces instead of tab
set expandtab
set smarttab
set shiftwidth=8
set tabstop=8

" Indentation and wrap
set autoindent
set smartindent
set textwidth=120
set linebreak
set wrap

" Search and match
set incsearch
set smartcase
set ignorecase
set magic
set hlsearch
set showmatch
set mat=2

" Command bar
set history=1000
set cmdheight=1
set wildmenu
set wildignore=*~,*.pyc,*.o,*.so,*.exe,*.dll,*.pdb
set wildignore+=*/.git/*,*/.svn/*

" Status bar
function! HasPaste()
    if &paste
        return "PASTE MODE   "
    endif
    return ""
endfunction
set ruler
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Use tabs to switch between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Color theme
syntax enable
set background=dark
try
    set termguicolors
    colorscheme jellybeans
    hi CursorLine term=none cterm=none gui=none
    hi CursorLineNr term=none cterm=none gui=none
catch
endtry

" Auto read when file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Return to the last edit position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Cursor line highlighting
nmap <silent> <F2> :setlocal cursorline!<cr>
imap <silent> <F2> <Esc>:setlocal cursorline!<cr>gi

" Line numbers
set number
nmap <silent> <F3> :setlocal number!<cr>
vmap <silent> <F3> :setlocal number!<cr>gv
imap <silent> <F3> <Esc>:setlocal number!<cr>gi

" Fast quit
nmap <silent> <F4> :quit<cr>

" Fast save
nmap <silent> <leader>w :w!<cr>

" Visual mode pressing * or # searches for the current selection
function! VisualSelection(cmdtype)
    let l:tmp = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = l:tmp
endfunction
vmap <silent> * :<C-u>call VisualSelection('/')<cr>/<c-r>=@/<cr><cr>
vmap <silent> # :<C-u>call VisualSelection('?')<cr>?<c-r>=@/<cr><cr>

" Map Space to / (search) and Ctrl-Space to ? (backwards search)
map <Space> /
map <C-@> ?

" Clear highlighting by Leader-Enter
map <silent> <leader><cr> :noh<cr>

" New tab with the current buffer's path
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" New tab
map <silent> <leader>tn :tabnew<cr>

" Move current tab left or right
map <silent> <leader>tl :-tabmove<cr>
map <silent> <leader>tr :+tabmove<cr>

" Switch CWD to the directory of the open buffer
map <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

" First and last non-blank characters in the line
map <leader>h ^
map <leader>l g_

" Move a line of text up or down
nmap <silent> <M-Up> :move .-2<cr>==
nmap <silent> <M-Down> :move .+1<cr>==
imap <silent> <M-Up> <Esc>:move .-2<cr>==gi
imap <silent> <M-Down> <Esc>:move .+1<cr>==gi
nmap <silent> <leader>k :move .-2<cr>==
nmap <silent> <leader>j :move .+1<cr>==
imap <silent> <leader>k <Esc>:move .-2<cr>==gi
imap <silent> <leader>j <Esc>:move .+1<cr>==gi

" Move text selection up or down
vmap <silent> <M-Up> :move '<-2<cr>gv=gv
vmap <silent> <M-Down> :move '>+1<cr>gv=gv
vmap <silent> <leader>k :move '<-2<cr>gv=gv
vmap <silent> <leader>j :move '>+1<cr>gv=gv

" Remove trailing spaces
nmap <silent> <F5> :%s/\s\+$//e<cr>:noh<cr>
imap <silent> <F5> <Esc>:%s/\s\+$//e<cr>:noh<cr>gi

" Change line ending like dos2unix
nmap <silent> <F6> :%s/\r\+$//e<cr>:noh<cr>
imap <silent> <F6> <Esc>:%s/\r\+$//e<cr>:noh<cr>gi

" Toggle paste mode
nmap <silent> <leader>pp :setlocal paste!<cr>

" Toggle spell check
nmap <silent> <leader>ss :setlocal spell!<cr>

" Spell check: next, prev, mark as good and suggest
nmap <leader>sn ]s
nmap <leader>sp [s
nmap <leader>sa zg
nmap <leader>s? z=

" Toggle hex mode
function! ToggleHexMode()
    if !exists("b:hexmode")
        let b:hexmode = 0
    endif
    if b:hexmode
        let b:hexmode = 0
        execute "%!xxd -u -g1 -c 24 -r"
        syntax enable
    else
        let b:hexmode = 1
        execute "%!xxd -u -g1 -c 24"
        syntax off
    endif
endfunction
nmap <silent> <F8> :call ToggleHexMode()<cr>
