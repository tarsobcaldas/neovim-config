local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("noa.lsp.handlers").on_attach,
		capabilities = require("noa.lsp.handlers").capabilities,
	}

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("noa.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server.name == "texlab" then
	 	local texlab = require("noa.lsp.settings.texlab")
	 	opts = vim.tbl_deep_extend("force", texlab, opts)
	 end

	 if server.name == "ltex" then
	 	local ltex = require("noa.lsp.settings.ltex")
	 	opts = vim.tbl_deep_extend("force", ltex, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
