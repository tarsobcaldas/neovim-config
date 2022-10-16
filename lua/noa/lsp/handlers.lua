local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style     = "minimal",
      border    = "rounded",
      source    = "always",
      header    = "",
      prefix    = "",
    },
  }

  vim.diagnostic.config(config)

end

local lsp_keys = {
  ["K"]          = "<cmd>lua vim.lsp.buf.hover()<CR>",
  ["gD"]         = "<cmd>lua vim.lsp.buf.declaration()<CR>",
  ["gd"]         = "<cmd>lua vim.lsp.buf.definition()<CR>",
  ["gi"]         = "<cmd>lua vim.lsp.buf.implementation()<CR>",
  ["gr"]         = "<cmd>lua vim.lsp.buf.references()<CR>",
  ["gl"]         = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
  ["[d"]         = '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
  ["]d"]         = '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
  -- ["<C-k>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>",
  ["<leader>D"]  = "<cmd>lua vim.lsp.buf.type_definition()<CR>",
  ["<leader>wa"] = "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
  ["<leader>wr"] = "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
  ["<leader>wl"] = "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
  ["<leader>rn"] = "<cmd>lua vim.lsp.buf.rename()<CR>",
  ["<leader>ca"] = "<cmd>lua vim.lsp.buf.code_action()<CR>",
  ["<leader>pf"] = "<cmd>lua vim.lsp.buf.formatting()<CR>",
  ["<leader>pq"] = "<cmd>lua vim.diagnostic.setloclist()<CR>",
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  for k, v in pairs(lsp_keys) do
    vim.api.nvim_buf_set_keymap(bufnr, "n", k, v, opts)
  end
end

local util = require 'vim.lsp.util'

local formatting_callback = function(client, bufnr)
  vim.keymap.set('n', '<leader>f', function()
    local params = util.make_formatting_params({})
    client.request('textDocument/formatting', params, nil, bufnr)
  end, { buffer = bufnr })
end

M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  lsp_keymaps(bufnr)
      formatting_callback(client, bufnr)
  if client.name ~= "texlab" then
    if vim.bo.filetype == "tex" then
      client.server_capabilities.document_formatting = false
    end
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
