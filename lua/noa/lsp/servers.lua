local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

require("nvim-lsp-installer").setup{
  ensure_installed = {
    "ltex", "texlab", "remark_ls", "sumneko_lua", "perlnavigator", "html",
    "yamlls", "clanged"

  }
}

require("noa.lsp.settings.ltex")
require("noa.lsp.settings.texlab")
require("noa.lsp.settings.remark_ls")
require("noa.lsp.settings.sumneko_lua")
require("noa.lsp.settings.perlnavigator")
require("noa.lsp.settings.html")
require("noa.lsp.settings.yamlls")
require("noa.lsp.settings.clanged")
