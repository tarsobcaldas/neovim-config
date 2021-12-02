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

  -- Simple plugins can be specified as strings
  use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specifc commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}


  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }


  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim'}

  -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}

  use {'lervag/vimtex'}

  -- Alterações em volta dos objetos de texto
  use {'tpope/vim-surround'}

  -- Comentar texto usando gcc
  use {'tpope/vim-commentary'}

  -- Criação de sessões
  use {'tpope/vim-obsession'}

  -- Integração com Git
  use {'tpope/vim-fugitive'}

  -- Esquemas de cores variados
  use {'rafi/awesome-vim-colorschemes'}

  -- Barra inferior com informações úteis
  use {
	'nvim-lualine/lualine.nvim',
	requires = {
		{'kyazdani42/nvim-web-devicons', opt = true},
		{'akinsho/bufferline.nvim'},
	}

  }
  

  -- Integração com scripts de powershell (precisa ser melhor configurado)
  -- use {'pprovost/vim-ps1'}

  -- Aumento de funcionalidades de <Tab>
  use {'ervandew/supertab'}

  -- Configuração de LSP
  use {'neovim/nvim-lspconfig'}

  -- Auto completar
  use {
	'ms-jpq/coq_nvim', branch = 'coq', requires = {
	  -- 9000+ Snippets
	  {'ms-jpq/coq.artifacts', branch = 'artifacts'},
	  -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
	  -- Need to **configure separately**
	  -- {'ms-jpq/oq.thirdparty', branch = '3p'}
	}
  }



  -- Fuzzy finding integrado ao Neovim
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}


  -- Árvore de desfazer (precisa ser melhor estudado)
  use {'mbbill/undotree'}

  -- Terminal de fácil acesso
  use {'akinsho/toggleterm.nvim'}

  use {'jeffkreeftmeijer/vim-numbertoggle'}

  use {'windwp/nvim-autopairs'}
end)


