vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.hs",
  callback = function()
    require("lint").try_lint()
  end,
})

require('lint').linters_by_ft = {
  hs = {'hlint'}
}
