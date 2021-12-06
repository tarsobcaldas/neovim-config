local map = vim.api.nvim_set_keymap

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lazy loading:
  -- Load on specifc commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Faz preview de markdown no browser (pesquisar mais)
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
		requires = {"nvim-treesitter/playground"}
  }
		

  use { 'kyazdani42/nvim-tree.lua',
	requires = {'kyazdani42/nvim-web-devicons'},
  }


  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim',
		-- requires = {'marko-cerovac/material.nvim'}	
	}

	use({'EdenEast/nightfox.nvim'})	
	use ({'sainnhe/edge'})

  use {'lervag/vimtex', ft = tex}
 
  -- Alterações em volta dos objetos de texto
  use {'tpope/vim-surround'}

  -- Comentar texto usando gcc
  use {'tpope/vim-commentary'}

  -- Criação de sessões
	use {'Shatur/neovim-session-manager'}

  -- Integração com Git
  use {'tpope/vim-fugitive'}

  -- Esquemas de cores variados
  use {'rafi/awesome-vim-colorschemes'}

	-- use {'Yagua/nebulous.nvim'}

  -- Barra inferior com informações úteis
  use {
	'nvim-lualine/lualine.nvim',
	requires = {
		{'kyazdani42/nvim-web-devicons', opt = true},
		{'akinsho/bufferline.nvim'},
	}

  }
  
  -- Configuração de LSP
  use {
			'neovim/nvim-lspconfig',
	}

  -- Auto completar
	use {'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				'hrsh7th/cmp-omni',
				'hrsh7th/cmp-emoji',
				'hrsh7th/cmp-nvim-lua',
				'petertriho/cmp-git',
				{"kdheepak/cmp-latex-symbols", ft = {"tex"}},
				'dcampos/cmp-snippy',
				'lukas-reineke/cmp-under-comparator',
				'dcampos/nvim-snippy',
				'honza/vim-snippets',
				'onsails/lspkind-nvim',
			}
	}



  -- Fuzzy finding integrado ao Neovim
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}


  -- Árvore de desfazer (precisa ser melhor estudado)
  use {'mbbill/undotree'}

  -- Terminal de fácil acesso
  use {'akinsho/toggleterm.nvim'}

	-- Liga relativenumber somente quando faz sentido
  use {'jeffkreeftmeijer/vim-numbertoggle'}

  use {'windwp/nvim-autopairs'}
end)


