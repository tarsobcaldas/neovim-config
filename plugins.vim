" call plugins
call plug#begin('~/.vim/plugged')
	" Integração com TeX
	Plug 'lervag/vimtex'

	" Alterações em volta dos objetos de texto
	Plug 'tpope/vim-surround'

	" Comentar texto usando gcc
	Plug 'tpope/vim-commentary'

	" Criação de sessões
	Plug 'tpope/vim-obsession'

	" Integração com Git
	Plug 'tpope/vim-fugitive'

	" Esquemas de cores variados
	Plug 'rafi/awesome-vim-colorschemes'

	" Barra inferior com informações úteis
	Plug 'vim-airline/vim-airline'
	let g:airline_extensions = ['tabline', 'branch']
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#buffer_nr_show = 1

	" Integração com scripts de powershell (precisa ser melhor configurado)
	Plug 'pprovost/vim-ps1'

	" Diminiução de distrações
	Plug 'junegunn/goyo.vim'

	" Aumento de funcionalidades de <Tab>
	Plug 'ervandew/supertab'

	" Interface de de auto completar
	Plug 'https://github.com/Valloric/YouCompleteMe'
		" make YCM compatible with UltiSnips (using supertab)
		let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
		let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
		let g:SuperTabDefaultCompletionType = '<C-n>'

	" Interface para a criação e uso de snippets
	Plug 'SirVer/ultisnips'
		let g:UltiSnipsEditSplit="vertical"
		" better key bindings for UltiSnipsExpandTrigger
		let g:UltiSnipsExpandTrigger = "<tab>"
		let g:UltiSnipsJumpForwardTrigger = "<tab>"
		let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
	
	" Snippets
	Plug 'honza/vim-snippets'

	" Auto-pair
	Plug 'LunarWatcher/auto-pairs', {'branch': 'develop'}
		let g:AutoPairsShortcutToggle = '<Leader>p' 
		let g:AutoPairsShortcutJump = '<Leader>n' 
		let g:AutopairsFlyMode = 1

	" Adiciona funcionalidades de Lua para o Neovim (necessário para o
	" telescope)
	Plug 'nvim-lua/plenary.nvim'

	" Fuzzy finding integrado ao Neovim
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

		" Usng Lua functions
		nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
		nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
		nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
		nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

	" Árvore de desfazer (precisa ser melhor estudado)
	Plug 'mbbill/undotree'
		nnoremap <F5> :UndotreeToggle<cr>

	" Terminal de fácil acesso
	Plug 'akinsho/toggleterm.nvim'

call plug#end()

lua require('noa')

