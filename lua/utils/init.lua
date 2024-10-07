vim.loader.enable()

function Source_files_from_dir(directory)
  for _, file in pairs(vim.fn.readdir(directory)) do
    local file = directory .. '/' .. file
    if vim.fn.filereadable(file) then
      vim.fn.execute('source ' .. file)
    end
  end
end

vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {pattern = {"*.h"},
  callback = function()
    vim.api.nvim_buf_set_var(0,'filetype','c')
  end
})
