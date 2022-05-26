local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	-- null_ls.builtins.formatting.latexindent.with({
	-- 	args = { "--local=~/.indentconfig.yaml", "-m", "-r" },
	-- }),
	-- null_ls.builtins.formatting.stylua,
	-- null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
	sources = sources,
})
