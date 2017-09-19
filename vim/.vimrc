syntax on
set encoding=utf-8
set nu
set list
set listchars=tab:>>,trail:.
set bg=dark
set showmatch
set incsearch
set hlsearch
set backspace=2
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set cursorline

" vim-plug: https://github.com/junegunn/vim-plug
" Install: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" cmake: brew install cmake or yum install cmake python-devel.x86_64
" vim: brew install vim
" tern: touch ~/.tern-config
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Command Maps
nmap <silent> <leader>m :exec &mouse != "" ? "set mouse=" : "set mouse=a"<CR>
nmap <silent> <leader>n :NERDTreeTabsToggle<CR>

" Settings
let g:NERDTreeMouseMode=3

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩 '
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
