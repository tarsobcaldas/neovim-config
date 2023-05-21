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
  use({ "wbthomason/packer.nvim" })

  -- 	-- Lazy loading:
  -- 	-- Load on specifc commands
  use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })
  use({ "tpope/vim-abolish" })
  use({ "tpope/vim-repeat" })

  use({ "tyru/open-browser.vim" })

  use({ "godlygeek/tabular", opt = true, cmd = { "Tabularize" } })

  use({
    "SidOfc/mkdx",
    {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end
    },
    ft = { "markdown" },
  })

  -- Post-install/update hook with neovim command
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = { "nvim-treesitter/playground" }
  })

  -- Integração com Git
  use({
    "TimUntersberger/neogit",
    requires = {
      "lewis6991/gitsigns.nvim",
      "sindrets/diffview.nvim",
      "akinsho/git-conflict.nvim",
      "nvim-lua/plenary.nvim",
    },
  })

  -- colorschemes
  use({
    "EdenEast/nightfox.nvim",
    "sainnhe/edge",
    "projekt0n/github-nvim-theme",
    "tanvirtin/monokai.nvim",
    "PHSix/nvim-hybrid",
    "sainnhe/everforest",
    "NTBBloodbath/doom-one.nvim",
    "catppuccin/nvim",
    "FrenzyExists/aquarium-vim",
    "ishan9299/nvim-solarized-lua",
    "titanzero/zephyrium",
    "rafamadriz/neon",
    "marko-cerovac/material.nvim",
    "Th3Whit3Wolf/one-nvim",
    "ray-x/starry.nvim",
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    opt = true
  })


  use({ "HiPhish/nvim-ts-rainbow2" })

  -- tex
  use({
    "lervag/vimtex",
    -- "frabjous/knap",
    "jbyuki/nabla.nvim",
    {"f3fora/nvim-texlabconfig", run = 'go build'}
  })

  use({
    "mrcjkb/haskell-tools.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    branch = "1.x.x"
  })

  use({ "brymer-meneses/grammar-guard.nvim" })
  use({ "vigoux/LanguageTool.nvim" })

  -- Alterações em volta dos objetos de texto
  use({ "machakann/vim-sandwich" })
  use({ "tpope/vim-surround" })
  -- use({ "ur4ltz/surround.nvim" })
  use({ "preservim/vim-textobj-quote" })

  -- Barra inferior com informações úteis
  use({
    "nvim-lualine/lualine.nvim",
    requires = {
      { "akinsho/bufferline.nvim" },
      { "arkav/lualine-lsp-progress" }
    },
  })

  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

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
      { "hrsh7th/cmp-nvim-lua",       ft = { "lua" } },
      "petertriho/cmp-git",
      { "kdheepak/cmp-latex-symbols", ft = { "tex" } },
      "lukas-reineke/cmp-under-comparator",
      "onsails/lspkind-nvim",
    },
  })

  use({
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*",
    run = "make install_jsregexp",
    requires = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "smjonas/snippet-converter.nvim"
    },
  })

  use({
    "nvim-lua/popup.nvim",
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
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-arecibo.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-packer.nvim",
      "nvim-telescope/telescope-github.nvim",
      "keyvchan/telescope-find-pickers.nvim",
      "crispgm/telescope-heading.nvim",
      rocks = { "openssl", "lua-http-parser" },
    },
  })

  -- Dashboard
  use({
    "goolord/alpha-nvim",
    requires = { "Shatur/neovim-session-manager" },
  })

  -- Árvore de desfazer
  use({ "jiaoshijie/undotree" })

  -- Terminal de fácil acesso
  use({ "akinsho/toggleterm.nvim" })

  -- Liga relativenumber somente quando faz sentido
  use({ "jeffkreeftmeijer/vim-numbertoggle" })

  use({ "windwp/nvim-autopairs" })

  use({
    "ggandor/leap.nvim",
    requires = "ggandor/flit.nvim"
  })

  -- Mantém o layout da janela ao fechar um buffer
  use({ "famiu/bufdelete.nvim" })

  use({ "numToStr/BufOnly.nvim" })

  use({ "fedepujol/move.nvim" })

  use({ "nvim-orgmode/orgmode" })

  -- Cria guia de identação (muito pesado)
  -- use({ "lukas-reineke/indent-blankline.nvim" })

  use({ "glacambre/firenvim" })

  -- Configuração de LSP
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
      "mfussenegger/nvim-lint",
      "barreiroleo/ltex-extra.nvim",
      { "folke/lsp-colors.nvim" },
    },
  })

  use({ "lewis6991/impatient.nvim" })

  -- Comentar texto usando gcc
  use({ "numToStr/Comment.nvim" })

  use({ "kyazdani42/nvim-web-devicons" })

  use({ "folke/trouble.nvim" })

  -- use({ "rhysd/clever-f.vim" })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
