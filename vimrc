" Indentation
filetype plugin indent on
set tabstop=4
set softtabstop=2
set shiftwidth=4
set noexpandtab

" Display
syntax on
color blackboard
set cursorline
set number
highlight CursorLine NONE ctermbg=0

" Search highlight (disable with <F4>)
set hlsearch
noremap <F4> :nohlsearch<CR>

" Completion
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType tpl set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete

" Smarty templates
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html

" Nginx 
au BufRead,BufNewFile /etc/nginx/* set ft=nginx 

" PHP FPM configuration
au BufRead,BufNewFile /etc/php5/fpm/* set syntax=dosini

