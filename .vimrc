" enable syntax highlighting
syntax enable

" show line numbers
set number
set relativenumber

" set tabs to have 4 spaces
set ts=4

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift the lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursorś current line
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" disable arrow keys to break bad habit
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" auto save when changing buffers
set autowriteall
