<<<<<<< HEAD
" Use powershell as default shell
let &shell = has('win32') ? 'powershell' : 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=

" turn absolute line numbers on
:set relativenumber
:set rnu
=======
runtime plugins.vim
runtime abbrev.vim
runtime maps.vim
runtime autocmd.vim
runtime config.vim
>>>>>>> 12f34e2 (Divisão de arquivos e adição de plugins)
