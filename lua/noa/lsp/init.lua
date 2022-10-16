local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("noa.lsp.handlers")
require("noa.lsp.lint")
require("noa.lsp.null-ls")
require("noa.lsp.servers")
