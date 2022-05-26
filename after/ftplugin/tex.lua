local cmp = require("cmp")
local options = {
  -- tabstop = 4,
  -- shiftwidth = 4
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[set iskeyword-=:-]])

require('cmp').setup.buffer {
  formatting = {
    format = function(entry, vim_item)
        vim_item.menu = ({
          omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          latex_symbols = "[Symbol]",
          path = "[Path]",
          luasnip = "[Snippet]",
          -- formatting for other sources
          })[entry.source.name]
        return vim_item
      end,
  },

  sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
    { name = 'omni' },
    { name = 'buffer' },
		{ name = "path" },
		{ name = "latex_symbols" },
    -- other sources
  }),
}


----WIP:
--local settings = {
--  vimtex_compiler_method = 'arara',
--  tex_flavor = 'latex',
--  vimtex_quickfix_ignore_filters = '',
--  vimtex_quickfix_mode = 0,
--  vimtex_view_automatic = 1,
--  vimtex_view_general_view = 'SumatraPDF',
--  vimtex_view_general_options = '-reuse-instance - forward-search @tex @line @pdf'
--}

-- for k, v in pairs(settings) do
--   vim.g[k] = v
-- end


vim.cmd([[
	let g:vimtex_compiler_method = 'latexmk'
	let g:vimtex_compiler_engine = 'lualatex'
	let g:tex_flavor='latex'

	let g:vimtex_compiler_arara = {
		\ 'options' : ['--verbose'],
		\}			

  let g:vimtex_compiler_latexmk = { 
          \ 'executable' : 'latexmk',
          \ 'options' : [ 
          \   '-lualatex',
          \   '-file-line-error',
          \   '-synctex=1',
          \   '-interaction=nonstopmode',
          \ ],
          \}

	let g:vimtex_quickfix_ignore_filters = []
  let g:vimtex_syntax_enabled=0

	let g:vimtex_quickfix_mode=0
	let g:vimtex_view_automatic=1

	" let g:vimtex_view_general_view = 'MuPDF'
	let g:vimtex_view_general_view = 'SumatraPDF'
  let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'


	function! s:write_server_name() abort
		let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
		call writefile([v:servername], nvim_server_file)
	endfunction

	augroup vimtex_common
		autocmd!
		autocmd FileType tex call s:write_server_name()
	augroup END

	let g:vimtex_doc_handlers = ['MyHandler']
	function! MyHandler(context)
		call vimtex#doc#make_selection(a:context)
		if !empty(a:context.selected)
			execute '!texdoc' a:context.selected
		endif
		return 
	endfunction
]])

