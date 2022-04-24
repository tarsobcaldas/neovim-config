return {
  on_attach = on_attach,
  capabilities = capabilities,
  autostart = true,
	settings = {
		ltex = {
			enabled = { "markdown", "tex", "latex", "bib"},
      markdown = {
        nodes = {["CodeBlock"] = "ignore", ["Code"] =  "ignore"}
      },
			language ={"pt-BR"},
			diagnosticSeverity = "information",
			setenceCacheSize = 2000,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = {"pt-BR"},
			},
			trace = { server = "verbose" },
      disabledRules = {
        ["en"] = { "MORFOLOGIK_RULE_EN" },
        ["en-AU"] = { "MORFOLOGIK_RULE_EN_AU" },
        ["en-CA"] = { "MORFOLOGIK_RULE_EN_CA" },
        ["en-GB"] = { "MORFOLOGIK_RULE_EN_GB" },
        ["en-NZ"] = { "MORFOLOGIK_RULE_EN_NZ" },
        ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
        ["en-ZA"] = { "MORFOLOGIK_RULE_EN_ZA" },
        ["es"] = { "MORFOLOGIK_RULE_ES" },
        ["it"] = { "MORFOLOGIK_RULE_IT_IT" },
        ["de"] = { "MORFOLOGIK_RULE_DE_DE" },
      },
		},
	},
}