vim.o.encoding = "utf-8"

vim.cmd([[

	if has ('win32')
	  let &shell = has('win32') ? 'powershell' : 'pwsh'
	  let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned'
	  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	  set shellquote= shellxquote=
	endif

	if has('win32')
		let g:python3_host_prog='vim.env.home/AppData/Local/Programs/Python/Python310/python.exe'
		let g:python_host_prog= 'C:/Python27/python.exe'
	endif
	syntax on
	set t_Co=256
	" set cursorline

	" colorscheme onedark
	
	let g:airline_theme='oceanicnext'
	" allow alows custom init.vim per project
	set exrc
	 
	" turn absolute line numbers on
	set relativenumber
	set nu
	" maintain buffers on the background
	set hidden
	set incsearch
	set scrolloff=8
	set signcolumn=yes
	set noswapfile
	 
	let g:netrw_browsex_viewer='expl2.cmd'
	" let g:netrw_liststyle = 3	
	" let g:netrw_browse_split = 4

	set shiftwidth=2
	set autoindent
	set smartindent
	set tabstop=2
	set undodir=~/.config/nvim/undodir
	set undofile
	set termguicolors
	set keymap=accents
	set completeopt=menu,menuone,noselect

	set ignorecase
	set smartcase

  autocmd Filetype clo set syntax=tex
  "	autocmd Filetype sty set syntax=tex
  "	autocmd Filetype cfg set syntax=tex

	filetype plugin on
	set omnifunc=syntaxcomplete#Complete

	let g:mapleader="\<Space>"

	set re=1

	set ttimeoutlen=90

]])


