syntax on
set cursorline
set number
set hlsearch
set tabstop=4
set softtabstop=2
set shiftwidth=4
set noexpandtab
noremap <F4> :nohlsearch<CR>
color blackboard
highlight CursorLine NONE ctermbg=0
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType tpl set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
let g:DisableAutoPHPFolding = 1
