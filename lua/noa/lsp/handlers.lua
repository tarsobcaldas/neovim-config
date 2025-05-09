local M = {}

local lsp_keys = {
  ["gD"]         = "definition",
  ["gi"]         = "implementation",
  ["gr"]         = "references",
  ["<leader>wa"] = "add_workspace_folder",
  ["<leader>wr"] = "remove_workspace_folder",
  ["<leader>rn"] = "rename",
  ["<leader>ca"] = "code_action",
  ["<leader>pf"] = "format",
  ["<leader>dt"] = "type_definition",
  ["<leader>sh"] = "signature_help"
}

local diagnostics_keys = {
  ["[d"] = "goto_prev",
  ["]d"] = "goto_next",
  ["<leader>gl"] = "open_float",
  ["<leader>pq"] = "setloclist"
}



vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local buffer = args.buf
    local opts = { silent = true }
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.server_capabilities.completionProvider then
      vim.bo[buffer].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end
    if client.server_capabilities.definitionProvider then
      vim.bo[buffer].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end
    for key, cmd in pairs(lsp_keys) do
      if client:supports_method('textDocument/' .. cmd) then
        vim.api.nvim_buf_set_keymap(buffer, 'n', key, '<cmd>lua vim.lsp.buf.' .. cmd .. '()<CR>', opts)
      end
    end
    for key, cmd in pairs(diagnostics_keys) do
      vim.api.nvim_buf_set_keymap(buffer, 'n', key, '<cmd>lua vim.diagnostic.' .. cmd .. '()<CR>', opts)
    end

  end
})


M.on_attach = function(client, bufnr)
  vim.api.nvim_create_autocmd('CursorMoved', {
    buffer = 0,
    callback = function() vim.lsp.buf.clear_references() end,
  })
  if client.supports_method('textDocument/documentHighlight') then
    vim.api.nvim_create_autocmd('CursorHold', {
      buffer = 0,
      callback = function() vim.lsp.buf.document_highlight() end,
    })
  end
end


local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({ name = 'DiagnosticSignError', text = '✘' })
sign({ name = 'DiagnosticSignWarn', text = '▲' })
sign({ name = 'DiagnosticSignHint', text = '⚑' })
sign({ name = 'DiagnosticSignInfo', text = '»' })

vim.diagnostic.config({
  severity_sort = true,
  float = {
    border = 'rounded',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")
lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  {
    autostart = true,
    capabilities = capabilities,
  }
)

M.capabilities = {}

return M
