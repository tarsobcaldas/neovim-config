local cmp = require("cmp")
local options = {
  -- tabstop = 4,
  -- shiftwidth = 4
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[set iskeyword-=:-]])

require('cmp').setup.buffer {
  formatting = {
    format = function(entry, vim_item)
        vim_item.menu = ({
          omni = "[VimTeX]",
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          latex_symbols = "[Symbol]",
          path = "[Path]",
          luasnip = "[Snippet]",
          -- formatting for other sources
          })[entry.source.name]
        return vim_item
      end,
  },

  sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
    { name = 'omni' },
    { name = 'buffer' },
		{ name = "path" },
		{ name = "latex_symbols" },
    -- other sources
  }),
}
