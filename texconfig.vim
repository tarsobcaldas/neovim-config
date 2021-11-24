let g:vimtex_compiler_method = 'arara'
let g:tex_flavor='latex'

let g:vimtex_quickfix_mode=0
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_view_automatic=1

function! s:write_server_name() abort
  let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
  call writefile([v:servername], nvim_server_file)
endfunction

augroup vimtex_common
  autocmd!
  autocmd FileType tex call s:write_server_name()
augroup END


let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_compiler_progname = 'nvr'


let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
  call vimtex#doc#make_selection(a:context)
  if !empty(a:context.selected)
    execute '!texdoc' a:context.selected
  endif
  return 1
endfunction


if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

autocmd BufNewFile,BufRead *.def set filetype=tex
autocmd FileType tex let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''",'$':'$', '$$':'$$'}
" autocmd FileType tex inoremap 
