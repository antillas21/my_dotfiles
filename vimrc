call pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=999

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file.
" setting leader key to ,
let mapleader = "\\"
let g:mapleader = "\\"

" Show line number, cursor position.
set ruler
set number
set relativenumber

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
" set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS AND FONTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Set color capabilities
set t_Co=256
"colorscheme grb4

" Font settings
" set guifont=Monaco\ 28
set guifont=Menlo\ 16

" Color scheme
" set t_Co=256
" set background=light
" let g:solarized_termcolors=256
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" colorscheme solarized
" colorscheme Github
colorscheme molokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT, TABS AND INDENTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Enable syntax highlighting.
syntax on

" Automatically indent when adding a curly bracket, etc.
set smartindent
set autoindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" set smarttab

" Use UTF-8.
set encoding=utf-8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BACKUPS AND TEMP FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Let Ctrl-P ignore certain directories
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|cache\|/vendor'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show column limit
set colorcolumn=80

" Display incomplete commands.
set showcmd

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell

" Disable toolbar by default in GUI
set guioptions-=T

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\
set statusline+=%f\
set statusline+=%h%m%r%w
set statusline+=\[%{strlen(&ft)?&ft:'none'}]
set statusline+=%=
set statusline+=0x%-8B
set statusline+=%-14(%l,%c%V%)
set statusline+=%<%P

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Taglist setup
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Map ctrl-, to remove all trailing white space
"map <C-p> :%s/\s\+$//<CR>

" Map jj to get esc in insert mode for quick exit
imap jj <ESC>

" Insert new line without leaving command mode
map <C-J> i<CR><Esc>k$

" Keep vim files in a sane place
"set backupdir=~/.vim/backups
"set directory=~/.vim/swaps

" tab navvigation like firefox
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>

set pastetoggle=<C-p>

let g:molokai_original=1

"configuring tabs
set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :CtrlPClearAllCaches<CR>
let NERDTreeQuitOnOpen = 1 " Close nerdtree on file open"
nnoremap <silent> <F7> :TlistToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v
noremap <leader>h <C-w>h

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with <c-l>
" imap <c-l> <space>=><space>

" Emmet trigger key
let g:user_emmet_leader_key='<tab>'

" Emmet should be available on html/css files only
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Faster CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBOARD CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable press-and-hold for keys in favor of key repeat
" defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

" Set a blazingly fast keyboard repeat rate
" defaults write NSGlobalDomain KeyRepeat -int 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! OpenTestAlternate()
"   let new_file = AlternateForCurrentFile()
"   exec ':e ' . new_file
" endfunction
" function! AlternateForCurrentFile()
"   let current_file = expand("%")
"   let new_file = current_file
"   let in_spec = match(current_file, '^spec/') != -1
"   let going_to_spec = !in_spec
"   let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
"   if going_to_spec
"     if in_app
"       let new_file = substitute(new_file, '^app/', '', '')
"     end
"     let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
"     let new_file = 'spec/' . new_file
"   else
"     let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
"     let new_file = substitute(new_file, '^spec/', '', '')
"     if in_app
"       let new_file = 'app/' . new_file
"     end
"   endif
"   return new_file
" endfunction
" nnoremap <leader>. :call OpenTestAlternate()<cr>
