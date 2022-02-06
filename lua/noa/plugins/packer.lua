local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Lazy loading:
	-- Load on specifc commands
	use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

	-- Faz preview de markdown no browser (pesquisar mais)
	use({
		"SidOfc/mkdx",
		requires = { "godlygeek/tabular" },
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
	})

	-- Post-install/update hook with neovim command
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", requires = { "nvim-treesitter/playground" } })

	-- Integração com Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"tpope/vim-fugitive",
		},
	})

	-- colorschemes
	use({ "EdenEast/nightfox.nvim" })
	use({ "sainnhe/edge" })
	use({ "projekt0n/github-nvim-theme" })
	use({ "tanvirtin/monokai.nvim" })
	use({ "PHSix/nvim-hybrid" })
	use({ "sainnhe/everforest" })
	use({ "NTBBloodbath/doom-one.nvim" })
	use({ "catppuccin/nvim" })
	use({ "FrenzyExists/aquarium-vim" })
	use({ "titanzero/zephyrium" })

	use({ "lervag/vimtex", ft = { "tex" } })

	use({ "brymer-meneses/grammar-guard.nvim" })

	-- Alterações em volta dos objetos de texto
	use({ "machakann/vim-sandwich" })
	use({ "tpope/vim-surround" })

	-- Comentar texto usando gcc
	use({ "tpope/vim-commentary" })

	-- Barra inferior com informações úteis
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			{ "akinsho/bufferline.nvim" },
		},
	})

	use({
		"kyazdani42/nvim-web-devicons",
		config = require("nvim-web-devicons").setup({})
	})

	-- Configuração de LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/nvim-lsp-installer",
			"jose-elias-alvarez/null-ls.nvim",
			"mfussenegger/nvim-lint",
			{
				"folke/lsp-colors.nvim",
				config = require("lsp-colors").setup(),
			},
		},
	})

	use({
		"folke/trouble.nvim",
		config = require("trouble").setup({}),
	})

	-- Auto completar
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-omni",
			"hrsh7th/cmp-emoji",
			{ "hrsh7th/cmp-nvim-lua", ft = { "lua" } },
			"petertriho/cmp-git",
			{ "kdheepak/cmp-latex-symbols", ft = { "tex" } },
			"lukas-reineke/cmp-under-comparator",
			"onsails/lspkind-nvim",
		},
	})

	use({
		"L3MON4D3/LuaSnip",
		requires = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	})

	-- Fuzzy finding integrado ao Neovim
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-arecibo.nvim",
			rocks = { "openssl", "lua-http-parser" },
		},
	})

	use({ "Shatur/neovim-session-manager" })

	-- Árvore de desfazer
	use({ "mbbill/undotree" })

	-- Terminal de fácil acesso
	use({ "akinsho/toggleterm.nvim" })

	-- Liga relativenumber somente quando faz sentido
	use({ "jeffkreeftmeijer/vim-numbertoggle" })

	use({ "windwp/nvim-autopairs" })

	use({ "ggandor/lightspeed.nvim" })

	-- Mantém o layout da janela ao fechar um buffer
	use({ "famiu/bufdelete.nvim" })
  
  use({ "lukas-reineke/indent-blankline.nvim" })


	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
