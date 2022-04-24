return {
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = { documentFormatting = true },
	cmd = { "texlab" },
	filetypes = { "tex", "bib", "cls", "sty", "def", "clo" },
	settings = {
		texlab = {
			build = {
				args = { "%f" },
				executable = "arara",
				forwardSearchAfter = true,
				onSave = false,
			},
			chktex = {
				onEdit = true,
				onOpenAndSave = true,
			},
			diagnosticsDelay = 100,
			forwardSearch = {
				executable = { "SumatraPDF" },
				args = {
					"-reuse-instance",
					"%p",
					"-forward-search",
					"%f",
					"%l",
				},
			},
			latexFormatter = nil,
			-- latexindent = {
			-- 	modifyLineBreaks = true,
			-- 	["local"] = { "C:/Users/noaxp/.indentconfig.yaml" },
			-- },
			rootDirectory = { "." },
		},
	},
}
