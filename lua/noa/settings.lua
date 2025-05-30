local options = {
	backup = false, -- creates a backup file
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 3, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
  mousemev = true,
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	ttimeoutlen = 90, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
  undodir = vim.fn.expand'~/.config/nvim/undodir',
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	number = true, -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 4, -- is one of my fav
	sidescrolloff = 8,
	incsearch = true, -- colors the search matches
	termguicolors = true, -- uses neovim colorscheme when using terminal
  keymap = "accents",
  hidden = true,
  laststatus = 3,
	clipboard = "unnamedplus"
}

vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set iskeyword+=-"


local arara_settings = {
  options = '--verbose',
}

local latexmk_settings = {
  executable = 'latexmk',
  options = "-file-line-error -synctex=1 -interaction=nonstopmode"
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

local settings = {
  mapleader = ' ',
  lightspeed_no_default_kaymaps = 1,
  loaded_gzip = 0,
  loaded_tar = 0,
  loaded_tarPlugin = 0,
  loaded_zipPlugin = 0,
  loaded_2html_plugin = 0,
  loaded_netrw = 0,
  loaded_netrwPlugin = 0,
  loaded_matchit = 0,
  loaded_matchparen = 0,
  loaded_spec = 0,
  loaded_coqtail = 1,
  clever_f_highlight_timeout_ms = 3000,
  material_style = "darker",
	tex_flavor='latex',
	vimtex_compiler_method = 'latexmk',
	vimtex_compiler_engine = 'lualatex',
	vimtex_quickfix_ignore_filters = "",
  vimtex_syntax_enabled=0,
	vimtex_quickfix_mode=0,
	vimtex_view_method = 'zathura',
  vimtex_compiler_latexmk = latexmk_settings,
  vimtex_compiler_arara = arara_settings,
  ['coqtail#supported'] = 0,
}

for k, v in pairs(settings) do
  vim.g[k] = v
end

-- vim.cmd([[
-- 	let g:vimtex_compiler_arara = {
-- 		\ 'options' : ['--verbose'],
-- 		\}			
--
--   let g:vimtex_compiler_latexmk = { 
--           \ 'executable' : 'latexmk',
--           \ 'options' : [ 
--           \   '-lualatex',
--           \   '-file-line-error',
--           \   '-synctex=1',
--           \   '-interaction=nonstopmode',
--           \ ],
--           \}
-- ]])
