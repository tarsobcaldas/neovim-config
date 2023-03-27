local status_ok, _ = pcall(require, "mason")
if not status_ok then
  return
end

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "ltex", "texlab", "remark_ls", "lua_ls", "perlnavigator", "html",
    "yamlls", "clangd"
  },
  automatic_installation = {exclude = {"hls"}}
}

require("noa.lsp.settings.ltex")
require("noa.lsp.settings.texlab")
require("noa.lsp.settings.remark_ls")
require("noa.lsp.settings.lua_ls")
require("noa.lsp.settings.perlnavigator")
require("noa.lsp.settings.html")
require("noa.lsp.settings.yamlls")
require("noa.lsp.settings.clanged")
require("noa.lsp.settings.hls")
