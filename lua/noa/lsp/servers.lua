local status_ok, _ = pcall(require, "mason")
if not status_ok then
  return
end

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "ltex", "texlab", "remark_ls", "lua_ls", "perlnavigator", "html",
    "yamlls", "clangd", "rust_analyzer", "jdtls"
  },
  automatic_installation = {exclude = {"hls"}}
}



local lsp_settings_dir = vim.fn.stdpath("config") .. "/lua/noa/lsp/settings/"
Source_files_from_dir(lsp_settings_dir)
