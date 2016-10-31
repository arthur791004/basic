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

"Use Tab to complete when typing words
function! Tab_Or_Complete()
  if col('.') > 1 && strpart(getline('.'), col('.') - 2, 3) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
"
