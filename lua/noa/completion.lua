local cmp = require'cmp'
local snippy = require("snippy")

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.texlab.setup {
		cmd = { "texlab" },
				filetypes = { "tex", "bib",
				"cls", "sty", "def"
		},

    -- root_dir = function(fname)
			-- return util.root_pattern '.latemkrc'(fname) or util.find_git_ancestor(fname)
		-- end,

    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = {"%f"},
          executable = "arara",
          forwardSearchAfter = true,
          onSave = false
        },
        chktex = {
          onEdit = true,
          onOpenAndSave = false
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          args = {}
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false
        }
      }
    },
    single_file_support = true
}

snippy.setup({
    mappings = {
        is = {
            ["<Tab>"] = "expand_or_advance",
            ["<S-Tab>"] = "previous",
        },
        -- nx = {
        --     ["<leader>x"] = "cut_text",
        -- },
    },
})

cmp.setup({

		snippet = {
			expand = function(args)
				require'snippy'.expand_snippet(args.body) -- For `snippy` users.
			end,
		},

		mapping = {
			['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
			}),
			['<CR>'] = cmp.mapping.confirm({ select = true }),

-- 			-- ["<Tab>"] = cmp.mapping(function(fallback)
-- 			-- 	if cmp.visible() then
-- 			-- 		cmp.select_next_item()
-- 			-- 	elseif snippy.can_expand_or_advance() then
-- 			-- 		snippy.expand_or_advance()
-- 			-- 	elseif has_words_before() then
-- 			-- 		cmp.complete()
-- 			-- 	else
-- 			-- 		fallback()
-- 			-- 	end
-- 			-- end, { "i", "s" }),
			
-- 			-- ["<S-Tab>"] = cmp.mapping(function(fallback)
-- 			-- 	if cmp.visible() then
-- 			-- 		cmp.select_prev_item()
-- 			-- 	elseif snippy.can_jump(-1) then
-- 			-- 		snippy.previous()
-- 			-- 	else
-- 			-- 		fallback()
-- 			-- 	end
-- 			-- end, { "i", "s" }),

		},

		sources = cmp.config.sources({
			{ name = 'snippy' }, -- For snippy users.
		  { name = 'nvim_lsp' },
		}, 
		  {
			{ name = 'buffer' },
			-- { omni = true}
		}	),

-- 		-- formatting = {
-- 		-- 		format = lspkind.cmp_format({with_text = false, maxwidth = 50})
-- 		-- 	}

})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})



