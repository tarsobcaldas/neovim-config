local options = {
	backup = false, -- creates a backup file
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 3, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
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
  undodir = "~/.config/nvim/undodir",
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
}

vim.opt.shortmess:append "c"
vim.cmd "colorscheme duskfox"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set iskeyword+=-"
-- vim.cmd "syntax off"


-- local knap_settings = {
--   texoutputext = "pdf",
--   textopdf = "lualatex -synctex=1 -halt-on-error -interaction=batchmode -shell-escape %docroot%",
--   textopdfviewerlaung = "sioyek %outputfile%"
-- }

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
  clever_f_highlight_timeout_ms = 3000,
  material_style = "darker",
	tex_flavor='latex',
	vimtex_compiler_method = 'latexmk',
	vimtex_compiler_engine = 'lualatex',
	vimtex_quickfix_ignore_filters = "",
  vimtex_syntax_enabled=0,
	vimtex_quickfix_mode=0,
  vimtex_view_use_temp_files=1,
	vimtex_view_method = 'zathura',
  vimtex_compiler_latexmk = latexmk_settings,
  vimtex_compiler_arara = arara_settings,
}

for k, v in pairs(settings) do
  vim.g[k] = v
end

vim.cmd([[
	if has ('win32')
	  let &shell = has('win32') ? 'powershell' : 'pwsh'
	  let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned'
	  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	  set shellquote= shellxquote=
	endif

	if has('win32')
		let g:python3_host_prog='~/AppData/Local/Programs/Python/Python310/python.exe'
		let g:python_host_prog= 'C:/Python27/python.exe'
	endif

  let $BROWSER = 'chrome.exe'
]])


vim.cmd([[

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
]])
