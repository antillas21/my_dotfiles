call pathogen#infect()

"Set color capabilities
set t_Co=256
"colorscheme grb4

set nocompatible

" Enable syntax highlighting.
syntax on

filetype plugin indent on

" Automatically indent when adding a curly bracket, etc.
set smartindent
set autoindent

" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" set smarttab

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=999

" Use UTF-8.
set encoding=utf-8

" Show line number, cursor position.
set ruler
set number

" Show column limit
set colorcolumn=80

" Display incomplete commands.
set showcmd

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Search as you type.
set incsearch

" Ignore case when searching.
set ignorecase

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell

" Font settings
" set guifont=Monaco\ 28
set guifont=Menlo\ 16

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

" Taglist setup
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Color scheme
"set t_Co=256
" set background=light
" let g:solarized_termcolors=256
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
colorscheme monokai

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

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.

"configuring tabs
set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>:w
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <silent> <F6> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1 " Close nerdtree on file open"
nnoremap <silent> <F7> :TlistToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>
