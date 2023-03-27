vim.cmd([[
  colorscheme tokyonight
  colorscheme kanagawa
]])

require('lualine').setup {
 sections = {
   lualine_a = {'mode'},
   lualine_b = {'branch', 'diff'},
   lualine_c = {'filename', 'lsp_progress'},
   lualine_x = {{'diagnostics', sources={'nvim_diagnostic', 'ale'}}, 'encoding', 'fileformat', 'filetype'},
   lualine_y = {'progress'},
   lualine_z = {'location'}
 },
}

require('bufferline').setup {
  options = {
    separator_style = "slant",
  }
}

