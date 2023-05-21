local ht = require('haskell-tools')
local buffer = vim.api.nvim_get_current_buf()
local def_opts = { noremap = true, silent = true, }
local capabilities = require("noa.lsp.handlers").capabilities

ht.start_or_attach {
  hls = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })
      -- haskell-language-server relies heavily on codeLenses,
      -- so auto-refresh (see advanced configuration) is enabled by default
      vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
      vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
      vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
    end,
  },
}

-- Suggested keymaps that do not depend on haskell-language-server:
local bufnr = vim.api.nvim_get_current_buf()
-- set buffer = bufnr in ftplugin/haskell.lua
local opts = { noremap = true, silent = true, buffer = bufnr }

-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, def_opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)


local lsp_keys = {
  ["K"]          = "<cmd>lua vim.lsp.buf.hover()<CR>",
  ["gD"]         = "<cmd>lua vim.lsp.buf.declaration()<CR>",
  ["gd"]         = "<cmd>lua vim.lsp.buf.definition()<CR>",
  ["gi"]         = "<cmd>lua vim.lsp.buf.implementation()<CR>",
  ["gr"]         = "<cmd>lua vim.lsp.buf.references()<CR>",
  ["gl"]         = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
  ["[d"]         = '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
  ["]d"]         = '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
  ["<leader>D"]  = "<cmd>lua vim.lsp.buf.type_definition()<CR>",
  ["<leader>wa"] = "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
  ["<leader>wr"] = "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
  ["<leader>wl"] = "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
  ["<leader>rn"] = "<cmd>lua vim.lsp.buf.rename()<CR>",
  ["<leader>ca"] = "<cmd>lua vim.lsp.buf.code_action()<CR>",
  ["<leader>cl"] = "<cmd>lua vim.lsp.codelens()<CR>",
  ["<leader>pf"] = "<cmd>lua vim.lsp.buf.format()<CR>",
  ["<leader>pq"] = "<cmd>lua vim.diagnostic.setloclist()<CR>",
}

local lspkeys_opts = { noremap = true, silent = true }
for k, v in pairs(lsp_keys) do
  vim.api.nvim_buf_set_keymap(bufnr, "n", k, v, lspkeys_opts)
end
