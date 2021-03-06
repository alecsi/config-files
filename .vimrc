" Mostly taken from https://github.com/wullxz/dotfiles/blob/68332089f8747435e9a658e850e51cf11214697a/vimrc

" ==== Setup Vundle ======
set nocompatible              " be iMproved, required for Vundle
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vimproc.vim/autoload/*
set rtp+=~/.vim/bundle/vimproc.vim/lib/*
set rtp+=~/.vim/bundle/vimproc.vim/plugin/*
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elm.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'vim-syntastic/syntastic'
call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" See :h vundle for more details or wiki for FAQ


" ==== For Plugins =
" = NERDTree
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$']

" = Ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim


" ==== Appearance ========
set laststatus=2
syntax on
set number
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set autochdir
set visualbell
set hidden
set mouse=a
set wildignore+=*/.git
set wildignore+=**/node_modules
set wildignore+=**/bower_components
set wildignore+=**/staging
set wildignore+=**/venv
set wildignore+=*.pyc
set showcmd
map <Leader>d "_d


" ==== Filetype stuff ====
autocmd BufNewFile, BufRead *.json set ft=javascript
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.ts set filetype=typescript


" ==== Useful others =====
" Press F3 before pasting, to avoid the indentation horror
set pastetoggle=<F3>

" Turn off auto indent
:setl noai nocin nosi inde=

" Turn off auto continuation of comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" Use F2 to toggle mouse mode
map <F2> :call ToggleMouse()<CR>
function! ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" enable syntax highlighting
syntax enable

" show line numbers
set number
set relativenumber

" show the matching part of the pair for [] {} and ()
set showmatch

" set backupcopy to be yes, this forces save to change the file on the drive, meaning watches can trigger a change (eg in webpack-dev-server)
set backupcopy=yes

" disable arrow keys to break bad habit
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" typescript config
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <Leader>i : <C-u>TsuImport<CR>
autocmd FileType typescript nmap <buffer> <Leader>r : <C-u>TsuReferences<CR>
autocmd FileType typescript nmap <buffer> <Leader>R : <C-u>TsuRenameSymbol<CR>

set statusline=%<%f\ %h%m%r

" for Syntastic messages:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" show line#:column# on the right hand side
set statusline+=%=%-14.(%l,%c%V%)\ %P

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']
let g:syntastic_typescript_tslint_exec = 'node_modules/.bin/tslint'
