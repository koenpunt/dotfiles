" Smarty templates
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html

" Nginx 
au BufRead,BufNewFile /etc/nginx/* set ft=nginx 
autocmd Filetype nginx setlocal ts=2 sts=2 sw=2 expandtab

" PHP FPM configuration
au BufRead,BufNewFile /etc/php5/fpm/* set syntax=dosini
