" Smarty templates
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html

" Nginx 
au BufRead,BufNewFile /etc/nginx/* set ft=nginx 

" PHP FPM configuration
au BufRead,BufNewFile /etc/php5/fpm/* set syntax=dosini
