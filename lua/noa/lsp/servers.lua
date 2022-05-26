local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

require("nvim-lsp-installer").setup{}
-- local lspconfig = require("lspconfig")
-- local	on_attach = require("noa.lsp.handlers").on_attach
-- local	capabilities = require("noa.lsp.handlers").capabilities

require("noa.lsp.settings.ltex")
require("noa.lsp.settings.texlab")
require("noa.lsp.settings.remark_ls")
require("noa.lsp.settings.sumneko_lua")
require("noa.lsp.settings.perlnavigator")
