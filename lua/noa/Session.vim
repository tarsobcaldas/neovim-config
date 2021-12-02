let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/AppData/Local/nvim/lua/noa
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd mappings.lua
edit ~/AppData/Local/nvim/ftplugin/tex.vim
argglobal
balt K:/Dropbox/LaTeX/testes/mwe.tex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 38 - ((37 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 38
normal! 0
lcd ~/AppData/Local/nvim/lua/noa
tabnext 1
badd +0 ~/AppData/Local/nvim/ftplugin/tex.vim
badd +88 ~/AppData/Local/nvim/lua/noa/mappings.lua
badd +10 K:/Dropbox/LaTeX/testes/mwe.tex
badd +28 ~/AppData/Local/nvim/lua/noa/ftplugin/tex.lua
badd +110 ~/AppData/Local/nvim/lua/noa/packer.lua
badd +1 ~/AppData/Local/nvim/lua/noa/telescope.lua
badd +8 ~/AppData/Local/nvim/lua/noa/init.lua
badd +6 ~/AppData/Local/nvim/lua/noa/toggleterm.lua
badd +4 ~/AppData/Local/nvim/init.vim~
badd +1 ~/AppData/Local/nvim/init.lua
badd +2 ~/AppData/Local/nvim/init.vim
badd +10 ~/AppData/Local/nvim-data/site/pack/packer/start/toggleterm.nvim/doc/toggleterm.txt
badd +1 ~/AppData/Local/nvim/lua/noa/abbrev.lua
badd +4 ~/AppData/Local/nvim/abbrev.vim
badd +1 ~/AppData/Local/nvim/ftplugin
badd +1 ~/AppData/Local/nvim/lua/noa/lspconfig.lua
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
