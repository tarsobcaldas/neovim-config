local actions = require('telescope.actions')
local previewers = require("telescope.previewers")

function nmap(shortcut, command)
  map('n', shortcut, command)
end

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
	},
		
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<C-x>"] = actions.delete_buffer,
					["<C-s>"] = actions.select_horizontal,
				},
				n = {
					["x"] = actions.delete_buffer,
				},
			},
		},
	},

	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {},
		},
		file_browser = {
			theme = "ivy",
		},
		project = {
			require("telescope.themes").get_dropdown {},
		}
	}
}

require("telescope").load_extension("ui-select")
require("telescope").load_extension('project')
require("telescope").load_extension('file_browser')
require("telescope").load_extension('gkeep')
require("telescope").load_extension('arecibo')
require("telescope").load_extension('gh')
