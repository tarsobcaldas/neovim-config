local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  {
    "tpope/vim-abolish",
    "tpope/vim-repeat",
    { "chentoast/marks.nvim",     config = true },
    { "windwp/nvim-autopairs",    config = true },
    { "tversteeg/registers.nvim", config = true },
    {
      "tyru/open-browser.vim",
      keys = {
        { "gx", "<Plug>(openbrowser-smart-search)", desc = "Open link under cursor", noremap = true, silent = true }
      }
    },
    {
      "famiu/bufdelete.nvim",
      keys = {
        { "<leader>xx", "<cmd>Bdelete<cr>",  desc = "Delete current buffer",         noremap = true, silent = true },
        { "<leader>xf", "<cmd>Bdelete!<cr>", desc = "Delete current buffer (force)", noremap = true, silent = true }
      }
    },
    {
      "numToStr/BufOnly.nvim",
      keys = {
        { "<leader>xa", "<cmd>BufOnly<cr>", desc = "Delete all other buffers", noremap = true, silent = true }
      }
    }
  },

  {
    "godlygeek/tabular",
    cmd = { "Tabularize" }
  },

  -- Post-install/update hook with neovim command

  {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground"
  },

  -- Integração com Git
  {
    "lewis6991/gitsigns.nvim",
    {
      "TimUntersberger/neogit",
      opts = {
        integrations = { diffview = true }
      },
      config = true,
      keys = {
        { "<leader>ng", ":Neogit<cr>", desc = "Open Neogit", noremap = true, silent = true }
      },
    },
    {
      "sindrets/diffview.nvim",
      config = true,
      keys = {
        { "<leader>do", ":DiffviewOpen<cr>",  desc = "Open Diffview",  noremap = true, silent = true },
        { "<leader>dc", ":DiffviewClose<cr>", desc = "Close Diffview", noremap = true, silent = true },
      }
    },
    {
      "akinsho/git-conflict.nvim",
      opts = { default_mappings = false },
      keys = {
        {
          "]x",
          "<Plug>(git-conflict-prev-conflict)",
          desc = "Previous git conflict",
          noremap = true,
          silent = true
        },
        {
          "[x",
          "<Plug>(git-conflict-next-conflict)",
          desc = "Next git conflict",
          noremap = true,
          silent = true
        },
        {
          "<leader>co",
          "<Plug>(git-conflict-ours)",
          desc = "Next git conflict",
          noremap = true,
          silent = true
        },
        {
          "<leader>ct",
          "<Plug>(git-conflict-theirs)",
          desc = "Next git conflict",
          noremap = true,
          silent = true
        },
        {
          "<leader>cb",
          "<Plug>(git-conflict-both)",
          desc = "Next git conflict",
          noremap = true,
          silent = true
        },
        {
          "<leader>c0",
          "<Plug>(git-conflict-none)",
          desc = "Next git conflict",
          noremap = true,
          silent = true
        },
        {
          "<leader>cqf",
          ":GitCoflictListQf<cr>",
          desc = "Next git conflict",
          noremap = true,
          silent = true
        },
      }
    }
  },

  -- Remote development
  {
    {
      "https://codeberg.org/esensar/nvim-dev-container",
      config = true
    },
    {
      "jamestthompson3/nvim-remote-containers",
    }
  },

  -- colorschemes

  {
    "folke/tokyonight.nvim",
    lazy = false,
    {
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
      "rebelot/kanagawa.nvim",
      optional = true
    }
  },

  {
    "hiphish/rainbow-delimiters.nvim"
  },

  -- tex

  {
    "mrcjkb/haskell-tools.nvim",
  },


  {
    "machakann/vim-sandwich",
    "tpope/vim-surround",
    "preservim/vim-textobj-quote"
  },

  -- Barra inferior com informações úteis

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      { "akinsho/bufferline.nvim" },
      { "leisurelicht/lualine-copilot.nvim" }
    },
  },


  { 'kevinhwang91/nvim-bqf', ft = 'qf' },

  -- Auto completar

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
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
      "zbirenbaum/copilot-cmp"
    },
  },



  {
    "L3MON4D3/LuaSnip",
    keys = {
      {
        "<leader>es",
        "<cmd>lua require('luasnip.loaders').edit_snippet_files()",
        desc = "Edit snippet file",
        noremap = true,
        silent = true
      },
    },
    build = "make install_jsregexp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "smjonas/snippet-converter.nvim"
    },
  },


  { "nvim-lua/popup.nvim" },


  -- Fuzzy finding integrado ao Neovim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-packer.nvim",
      "nvim-telescope/telescope-github.nvim",
      "keyvchan/telescope-find-pickers.nvim",
      "crispgm/telescope-heading.nvim",
      "cljoly/telescope-repo.nvim",
      "dhruvmanila/browser-bookmarks.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    keys = {
      {
        "<leader>fs",
        "<cmd>Telescope file_browser<cr>",
        desc = "Telescope File Browser",
        noremap = true,
        silent = true
      },
      {
        "<leader>ff",
        "<cmd>lua require('telescope.builtin').find_files()<cr>",
        desc = "Telescope Files",
        noremap = true,
        silent = true
      },
      {
        "<leader>fg",
        "<cmd>lua require('telescope.builtin').live_grep()<cr>",
        desc = "Telescope Live Grep",
        noremap = true,
        silent = true
      },
      {
        "<leader>fb",
        "<cmd>lua require('telescope.builtin').buffers()<cr>",
        desc = "Telescope Buffers",
        noremap = true,
        silent = true
      },
      {
        "<leader>fh",
        "<cmd>lua require('telescope.builtin').help_tags()<cr>",
        desc = "Telescope Help Files",
        noremap = true,
        silent = true
      },
      {
        "<leader>fk",
        "<cmd>lua require('telescope.builtin').keymaps()<cr>",
        desc = "Telescope Keymaps",
        noremap = true,
        silent = true
      },
      {
        "<leader>fc",
        "<cmd>lua require('telescope.builtin').colorscheme()<cr>",
        desc = "Telescope Colorschemes",
        noremap = true,
        silent = true
      },
      {
        "<leader>fo",
        "<cmd>lua require('telescope.builtin').oldfiles()<cr>",
        desc = "Telescope Old files",
        noremap = true,
        silent = true
      },
      {
        "<leader>fq",
        "<cmd>lua require('telescope.builtin').quickfix()<cr>",
        desc = "Telescope Quickfix List",
        noremap = true,
        silent = true
      },
      {
        "<leader>pj",
        "<cmd>lua require('telescope').extensions.project.project()<cr>",
        desc = "Telescope Projects",
        noremap = true,
        silent = true
      },
      {
        "<leader>bb",
        "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>",
        desc = "Telescope Bookmarks",
        noremap = true,
        silent = true
      },
      {
        "<leader>frp",
        "<cmd>lua require('telescope').extensions.repo.repo()<cr>",
        desc = "Telescope respositories",
        noremap = true,
        silent = true
      },
      {
        "<leader>fre",
        "<cmd>lua require('telescope.builtin').resume()<cr>",
        desc = "Open last Telescope search",
        noremap = true,
        silent = true
      },
      {
        "<leader>frg",
        "<cmd>lua require('telescope.builtin').registers()<cr>",
        desc = "Telescope registers",
        noremap = true,
        silent = true
      },
      {
        "<leader>fmk",
        "<cmd>lua require('telescope.builtin').marks()<cr>",
        desc = "Telescope marks",
        noremap = true,
        silent = true
      },
      {
        "<leader>fmd",
        "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>",
        desc = "Telescope Media Files",
        noremap = true,
        silent = true
      },
      {
        "<leader>fpi",
        "<cmd>lua require('telescope').extensions.find_pickers.find_pickers()<cr>",
        desc = "Telescope pickers",
        noremap = true,
        silent = true
      },
    }
  },


  -- Dashboard
  {
    "goolord/alpha-nvim",
    dependencies = { "Shatur/neovim-session-manager" },
    keys = {
      { "<leader>sl", ":SessionManager load_session<cr>",   desc = "Load session",   noremap = true, silent = true },
      { "<leader>sd", ":SessionManager delete_session<cr>", desc = "Delete session", noremap = true, silent = true }
    }
  },


  -- Árvore de desfazer
  {
    "jiaoshijie/undotree",
    keys = {
      {
        "<leader>ut",
        "<cmd>lua require('undotree').toggle()<cr>",
        desc = "Toggle Undotree",
        noremap = true,
        silent = true
      }
    }
  },

  -- Terminal de fácil acesso
  { "akinsho/toggleterm.nvim" },


  {
    "stevearc/oil.nvim",
    config = true,
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory", noremap = true, silent = true }
    }
  },

  -- Liga relativenumber somente quando faz sentido
  { "jeffkreeftmeijer/vim-numbertoggle" },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    --@type Flash.Config

    opts = {
      modes = {
        char = {
          keys = { "f", "F", ";", "," },
        }
      }
    },

    -- stylua: ignore
    keys = {
      { "<C-t>", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "<M-t>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },

  {
    "ggandor/leap.nvim",
    config = true,
    keys = {
      { "t", "<Plug>(leap-forward)",  desc = "Leap forward around buffer",   noremap = true, silent = true },
      { "T", "<Plug>(leap-backward)", desc = "Leap backwards around buffer", noremap = true, silent = true }
    }
  },

  {
    "fedepujol/move.nvim",
    keys = {
      { "<C-Up>",    ":MoveLine(-1)<CR>",  desc = "Move line up",         noremap = true, silent = true },
      { "<C-Down>",  ":MoveLine(1)<CR>",   desc = "Move line down",       noremap = true, silent = true },
      { "<C-Left>",  ":MoveHChar(-1)<CR>", desc = "Move character left",  noremap = true, silent = true },
      { "<C-Right>", ":MoveHChar(1)<CR>",  desc = "Move character right", noremap = true, silent = true },
    }
  },

  -- Cria guia de identação (muito pesado)
  -- "lukas-reineke/indent-blankline.nvim"

  { "glacambre/firenvim" },

  -- Configuração de LSP

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
      "mfussenegger/nvim-lint",
      "barreiroleo/ltex-extra.nvim",
      { "folke/lsp-colors.nvim" },
    },
  },

  {
    "brymer-meneses/grammar-guard.nvim",
    "vigoux/LanguageTool.nvim"
  },


  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<Leader>dB",
        "<cmd>lua require('dap').set_breakpoint()<cr>",
        desc = "Dap set breakpoint",
        noremap = true,
        silent = true,
      },
      {
        "<leader>db",
        "<cmd>lua require('dap').toggle_breakpoint()<cr>",
        desc = "Dap toggle breakpoint",
        noremap = true,
        silent = true,
      },
      {
        "<leader>dd",
        "<cmd>lua require('dap').continue()<cr>",
        desc = "Dap Continue",
        noremap = true,
        silent = true,
      },
      {
        "<leader>ds",
        "<cmd>lua require('dap').step_over()<cr>",
        desc = "Dap Step Over",
        noremap = true,
        silent = true,
      },
      {
        "<leader>di",
        "<cmd>lua require('dap').step_into()<cr>",
        desc = "Dap Step Into",
        noremap = true,
        silent = true,
      },
      {
        "<leader>dr",
        "<cmd>lua require('dap').repl_open()<cr>",
        desc = "Dap Toggle Repl",
        noremap = true,
        silent = true,
      },
      {
        "<leader>rl",
        "<cmd>lua require('dap').run_last()<cr>",
        desc = "Dap Run Last",
        noremap = true,
        silent = true,
      },
      {
        '<Leader>dh',
        "<cmd>lua require('dap.ui.widgets').hover()<cr>",
        desc = "Dap Hover",
        noremap = true,
        silent = true,
      },
      {
        '<Leader>dp',
        "<cmd>lua require('dap.ui.widgets').preview())<cr>",
        desc = "Dap Preview",
        noremap = true,
        silent = true,
      },
      {
        '<Leader>df',
        "<cmd>lua require('dap.ui.widgets').centered_float(widgets.frames)<cr>",
        desc = "Dap Frames",
        noremap = true,
        silent = true,
      },
      {
        '<Leader>ds',
        "<cmd>lua require('dap.ui.widgets').centered_float(widgets.scopes)<cr>",
        desc = "Dap scopes",
        noremap = true,
        silent = true,
      }
    }
  },

  -- Comentar texto usando gcc
  {
    "numToStr/Comment.nvim",
    config = true,
  },

  { "kyazdani42/nvim-web-devicons" },

  {
    "folke/trouble.nvim",
    keys = {
      {
        "<leader>tt",
        "<cmd>Trouble<cr>",
        desc = "Toggle trouble.nvim",
        noremap = true,
        silent = true
      },
      {
        "<leader>td",
        "<cmd>Trouble diagnostics<cr>",
        desc = "Document diagnostics on trouble.nvim",
        noremap = true,
        silent = true
      },
      {
        "<leader>tl",
        "<cmd>Trouble loclist<cr>",
        desc = "Loclist on trouble.nvim",
        noremap = true,
        silent = true
      },
      {
        "<leader>tq",
        "<cmd>Trouble quickfix<cr>",
        desc = "Quickfixlist on trouble.nvim",
        noremap = true,
        silent = true
      },
      {
        "<leader>tr",
        "<cmd>Trouble lsp_references<cr>",
        desc = "LSP references on trouble.nvim",
        noremap = true,
        silent = true
      }
    }
  },


  { "Decodetalkers/csv-tools.lua" },

  { "jghauser/mkdir.nvim" },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader><leader>", "<cmd>NoiceDismiss<cr>", noremap = true, silent = true }
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
    dependencies = {
      "rcarriga/nvim-notify",
      "MunifTanjim/nui.nvim"
    }
  },

  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },

  { "vladdoster/remember.nvim" },

  {
    "lervag/vimtex",
    {
      "jbyuki/nabla.nvim",
      ft = "tex",
      keys = {
        { "<leader>nb", "<cmd>lua require('nabla').popup()<cr>", desc = "Open Nabla", noremap = true, silent = true },
      }
    },
    {
      "f3fora/nvim-texlabconfig",
      build = 'go build',
      ft = "tex",
      keys = {
        { "<leader>ll", ":TexlabBuild<cr>",          desc = "Build with Texlab", noremap = true, silent = true },
        { "<leader>lL", ":TexlabCancelBuild<cr>",    desc = "Build with Texlab", noremap = true, silent = true },
        { "<leader>lc", ":TexlabCleanAuxiliary<cr>", desc = "Build with Texlab", noremap = true, silent = true },
        { "<leader>lv", ":TexlabForward<cr>",        desc = "Forwward Search",   noremap = true, silent = true }
      }
    }
  },

  {
    "Thiago4532/mdmath.nvim",
    ft = { "markdown" },
    opts = {
      filetypes = { "markdown" },
    }
  },

  {
    "Saecki/crates.nvim"
  },

  {
    "mrcjkb/rustaceanvim",
    version = '^5',
    lazy = false
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    keys = {
      { "<leader>mt", "<Plug>MarkdownPreviewToggle", desc = "Markdown Preview", noremap = true, silent = true }
    }
  },

  { "folke/todo-comments.nvim", config = true },

  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
  },

  {
    "kiyoon/jupynium.nvim",
    build = "pipx install --user .",
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    keys = {
      {
        "<M-o>",
        "<Cmd>lua require'jdtls'.organize_imports()<CR>",
        desc = "Organize imports",
        noremap = true,
        silent = true
      },
      {
        "crv",
        "<Cmd>lua require('jdtls').extract_variable()<CR>",
        desc = "Extract variable",
        noremap = true,
        silent = true
      },
      {
        "crv",
        "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
        desc = "Extract variable (visual)",
        mode = { "v" },
        noremap = true,
        silent = true
      },
      {
        "crc",
        "<Cmd>lua require('jdtls').extract_constant()<CR>",
        desc = "Extract constant",
        noremap = true,
        silent = true
      },
      {
        "crc",
        "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
        desc = "Extract constant (true)",
        mode = { "v" },
        noremap = true,
        silent = true
      },
      {
        "crm",
        "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
        desc = "Extract method (true)",
        mode = { "v" },
        noremap = true,
        silent = true
      },
      {
        "<M-c>",
        ":JdtCompile",
        desc = "Compile",
        noremap = true,
        silent = true
      }
    }
  },

  { 'whonore/Coqtail' },

  {
    'tomtomjhj/vscoq.nvim',
    config = true
  },

  {
    'miversen33/netman.nvim'
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim"
    },
    keys = {
      { "<leader>nt", ":Neotree<CR>", desc = "Open Neotree" },
    }
  },

  {
    'subnut/nvim-ghost.nvim'
  },

  {
    "lewis6991/hover.nvim",
    config = {
      init = function()
        -- Require providers
        require("hover.providers.lsp")
        require('hover.providers.gh')
        require('hover.providers.gh_user')
        require('hover.providers.jira')
        require('hover.providers.dap')
        require('hover.providers.fold_preview')
        require('hover.providers.diagnostic')
        require('hover.providers.man')
        require('hover.providers.dictionary')
      end,
      preview_opts = {
        border = 'single'
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true,
      mouse_providers = {
        'LSP'
      },
      mouse_delay = 1000
    },

    keys = {
      {
        "K",
        function()
          local api = vim.api
          local hover_win = vim.b.hover_preview
          if hover_win and api.nvim_win_is_valid(hover_win) then
            api.nvim_set_current_win(hover_win)
          else
            require("hover").hover()
          end
        end,
        desc = "Hover"
      },
      { "gK",          "<cmd>lua require('hover').hover_select()<cr>",           desc = "Hover (select)" },
      { "<C-p>",       "<cmd>lua require('hover').hover_switch('previous')<cr>", desc = "Hover (previous source)" },
      { "<C-n>",       "<cmd>lua require('hover').hover_switch('next')<cr>",     desc = "Hover (next source)" },
      { "<MouseMove>", "<cmd>lua require('hover').hover_mouse()<cr>",            desc = "Hover (mouse)" }
    },

    lazy = true
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
}

local opts = {
  rocks = {
    hererocks = true
  },
}

require("lazy").setup(plugins, opts)

local plugin_settings_dir = vim.fn.stdpath("config") .. "/lua/noa/plugins/settings/"
Source_files_from_dir(plugin_settings_dir)
