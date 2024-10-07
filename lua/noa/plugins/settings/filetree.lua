require('netman')
require("neo-tree").setup({
  sources = {
    "filesystem",
    "netman.ui.neo-tree"
  },
  filesystem = {
    hijack_netrw_behavior = "open_current",
    window = {
      position = "current"
    }
  }
})
