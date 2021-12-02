local actions = require('telescope.actions')
local previewers = require("telescope.previewers")

require('telescope').setup{
  defaults = {
	file_sorter = require("telescope.sorters").get_fzy_sorter,
	prompt_prefix = " >",
    color_devicons = true,
	layout_config = {
		prompt_position = "top",
	},
	sorting_strategy = "ascending",
	preview = {
		treesitter = "true",
	},
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    mappings = {
      i = {
		["<C-x>"] = actions.delete_buffer,
		["<C-s>"] = actions.select_horizontal,
      },
	  n = {
		["<C-x>"] = actions.delete_buffer,
	  },
    },
  }
}

