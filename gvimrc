" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                              GUI stuff                                    |
" -----------------------------------------------------------------------------  


" Default size of window
set columns=190 
set lines=50

" OS Specific *****************************************************************
if has("gui_macvim")

  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  set guifont=Monaco:h15
  set guioptions-=T  " remove toolbar
  set stal=2 " turn on tabs by default
  set guioptions+=c " remove mac dialogs or Ctrl+F7 toggles keyboard dialog navigation

  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
elseif has("gui_gtk2")
  set guifont=Monaco
  set guioptions-=T  " remove toolbar
elseif has("x11")
elseif has("gui_win32")
end

" General *********************************************************************
set anti " Antialias font

"set transparency=0

" Tab headings 
set gtl=%t gtt=%F

" gedim plugin
" 1440x900: MacBookPro 15"
" 1280x800: MacBookPro 13"
let g:screenDimensions = { '1920,1080': [ 210, 80 ], '1280,800': [ 207,60 ], 'default' :[50,50] }
