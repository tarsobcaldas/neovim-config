vim.g.firenvim_config = {
  localSettings = {
    [ [[.*]] ] = {
      cmdline = 'firenvim',
      priority = 0,
      selector = 'textarea:not([readonly]):not([class="handsontableInput"]), div[role="textbox"]',
      takeover = 'always',
    },
    [ [[.*notion\.so.*]] ] = {
      priority = 9,
      takeover = 'never',
    },
    [ [[.*docs\.google\.com.*]] ] = {
      priority = 9,
      takeover = 'never',
    },
    [ [[.*twitter\.com.*]] ] = {
      priority = 9,
      takeover = 'never',
    },
    [ [[.*overleaf\.com.*]] ] = {
      priority = 9,
      takeover = 'never',
    },
  },
}


vim.api.nvim_create_autocmd("BufEnter", {pattern = "github.com_*.txt", command = "set filetype=markdown"})

