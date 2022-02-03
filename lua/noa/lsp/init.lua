local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("noa.lsp.lsp-installer")
require("noa.lsp.handlers")
require("noa.lsp.null-ls")
require("noa.lsp.lint")
