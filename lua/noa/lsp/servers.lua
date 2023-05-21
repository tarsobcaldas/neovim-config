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

