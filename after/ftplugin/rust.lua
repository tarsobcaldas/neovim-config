local executors = require('rustaceanvim.executors')
local bufnr = vim.api.nvim_get_current_buf()

local normal_keys = {
  ["J"] = "joinLines",
  ["<leader>lr"] = "runnables",
  ["<leader>rr"] = { "run", bang = true },
  ["<leader>ca"] = "codeAction",
  ["<leader>dr"] = "debug",
  ["<leader>ld"] = "debuggables",
  ["<leader>od"] = "openDocs",
  ["<leader>oc"] = "openCargo"
}
local visual_keys = {
  ["<leader>rr"] = "run",
  ["<leader>ca"] = "codeAction",
  ["<leader>dr"] = "debug",
}
local insert_keys = {
  ["<A-a>"] = "<'a>",
}

local opts = { noremap = true, silent = true, buffer = bufnr }
for key, cmd in pairs(normal_keys) do
  vim.keymap.set('n', key, function() vim.cmd.RustLsp(cmd) end, opts)
end


for key, cmd in pairs(visual_keys) do
  vim.keymap.set('v', key, function() vim.cmd.RustLsp(cmd) end, opts)
end


for key, cmd in pairs(insert_keys) do
  vim.keymap.set('i', key, cmd, opts)
end


vim.g.rustaceanvim = {
  tools = { executor = "toggleterm", },
  server = {
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        tools = {
          executor = "toggleterm",
        }
      },
    },
  }
}

local cmp = require("cmp")
cmp.setup.buffer {
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        -- omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
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
    -- other sources
  }),
}

vim.api.nvim_create_autocmd('CursorMoved', {
  buffer = 0,
  callback = function() vim.lsp.buf.clear_references() end,
})
vim.api.nvim_create_autocmd('CursorHold', {
  buffer = 0,
  callback = function() vim.lsp.buf.document_highlight() end,
})
