call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'

call plug#end()


set nu
set ts=4 sw=4
set expandtab
set smarttab

syntax enable

:nnoremap <C-b> :NERDTreeToggle<CR>
