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
require'telescope'.load_extension('project')
require'telescope'.load_extension('file_browser')
require'telescope'.load_extension('arecibo')


-- Telescope mappings
nmap ("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap ("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap ("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap ("<leader>fs", "<cmd>Telescope file_browser<cr>")
nmap ("<leader>fp", "<cmd>Telescope project<cr>")
nmap ("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
nmap ("<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
nmap ("<leader>fc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>")
nmap ("<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
nmap ("<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>")
nmap ("<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>")
nmap ("<leader>fre", "<cmd>lua require('telescope.builtin').resume()<cr>")
nmap ("<leader>frg", "<cmd>lua require('telescope.builtin').registers()<cr>")
nmap ("<leader>fw", "<cmd>lua require('telescope').extensions.arecibo.websearch()<cr>")
