" enable syntax highlighting
syntax enable

" show line numbers
set number
set relativenumber

" show the matching part of the pair for [] {} and ()
set showmatch

" disable arrow keys to break bad habit
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" no need to save when changing buffers
set hidden

" directory list starts in the current directory
set autochdir

" use the filetype-dependent settings in the .vim directory
filetype plugin indent on

"don't want to see certain files when I do a :e.
set wildignore=*.pyc
