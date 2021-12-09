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

	extensions = {}
}


require'telescope'.load_extension('project')
require('telescope').load_extension('sessions')


-- Telescope mappings
nmap ("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap ("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap ("<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap ("<leader>fs", "<cmd>Telescope sessions<cr>")
nmap ("<leader>fp", "<cmd>Telescope project<cr>")
nmap ("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
nmap ("<leader>tc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>")
-- nmap ("<leader>fb", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>")
