require('neogit').setup({
  integrations = {
    diffview = true
  }
})

require('gitsigns').setup()
require('diffview').setup({

})
require('git-conflict').setup({
  default_mappings = false,
})
