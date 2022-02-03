vim.cmd([[au BufWritePost * lua require('lint').try_lint()]])

require('lint').linters_by_ft = {
	tex = {'chktex'}
}
