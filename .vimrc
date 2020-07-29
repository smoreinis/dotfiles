syntax on

set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

set updatecount=40
set updatetime=1000

set number
set showmode
set showmatch
set ruler
set incsearch
set hlsearch
set backspace=2
set visualbell

" tmux lags escape key :(
:imap ii <Esc>

set textwidth=80
function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    call matchadd('ErrorMsg', '\%>' . &l:textwidth . 'v.\+', -1)
  endif
endfunction

augroup filetypedetect
au WinEnter,BufNewFile,BufRead * call HighlightTooLongLines()
augroup END

autocmd BufWritePre * %s/\s\+$//e
