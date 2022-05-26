local opts = {noremap = true, silent = true}

local function map(mode, shortcut, command, options)
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

local function noremap(mode, shortcut, command)
  map(mode, shortcut, command, opts)
end

local normal = {
  -- Clever F
  [";"] = "<Plug>(clever-f-repeat-forward)",
  [","] = "<Plug>(clever-f-repeat-back)",

	-- Undo tree
	["<F5>"] = "<cmd>UndotreeToggle<cr>",

  -- open URL without netrw
  ["gx"] = "<Plug>(openbrowser-smart-search)",

	["]b"] = "<cmd>BufferLineCycleNext<cr>",
	["[b"] = "<cmd>BufferLineCyclePrev<cr>",
  -- Gitsigns
  ["]g"] = ":Gitsigns next_hunk<cr>",
  ["[g"] = ":Gitsigns prev_hunk<cr>",

	-- add empty lines
	["[<space>"] = "<cmd>put! =repeat(nr2char(-10), v:count-1)<cr>",
	["]<space>"] = "<cmd>put =repeat(nr2char(10), v:count1)<cr>",

	-- Use cd to change to current folder
	["<leader>cd"] = ":cd %:p:h<CR>:pwd<CR>",

	["<Leader>xx"] = "<cmd>Bdelete<cr>",
	["<Leader>xf"] = "<cmd>Bdelete!<cr>",

	["<space><"] = "<cmd>BufferLineMovePrev<cr>",
	["<space>>"] = "<cmd>BufferLineMoveNext<cr>",

	-- Move through windows
	["<M-h>"] = "<c-w>h",
	["<M-j>"] = "<c-w>j",
	["<M-k>"] = "<c-w>k",
	["<M-l>"] = "<c-w>l",

  -- Move.nvim
  ["<C-Up>"] = ":MoveLine(-1)<CR>",
  ["<C-Down>"] = ":MoveLine(1)<CR>",
  ["<C-Left>"] = ":MoveHChar(-1)<CR>",
  ["<C-Right>"] = ":MoveHChar(1)<CR>",

	["<leader>mt"] = "<Plug>MarkdownPreviewToggle",

	-- Quickfix
	["<C-j>"] = ":cnext<cr>",
	["<C-k>"] = ":cprevious<cr>",
	["<leader>qf"] = ":copen<cr>",

	-- Trouble
	["<leader>tt"] = "<cmd>TroubleToggle<cr>",
	["<leader>tw"] = "<cmd>Trouble workspace_diagnostics<cr>",
	["<leader>td"] = "<cmd>Trouble document_diagnostics<cr>",
	["<leader>tl"] = "<cmd>Trouble loclist<cr>",
	["<leader>tq"] = "<cmd>Trouble quickfix<cr>",
	["<leader>tr"] = "<cmd>Trouble lsp_references<cr>",

	-- Telescope
	["<leader>fp"]  = "<cmd>Telescope project<cr>",
	["<leader>fs"]  = "<cmd>Telescope file_browser<cr>",
	["<leader>ff"]  = "<cmd>lua require('telescope.builtin').find_files()<cr>",
	["<leader>fg"]  = "<cmd>lua require('telescope.builtin').live_grep()<cr>",
	["<leader>fb"]  = "<cmd>lua require('telescope.builtin').buffers()<cr>",
	["<leader>fh"]  = "<cmd>lua require('telescope.builtin').help_tags()<cr>",
	["<leader>fk"]  = "<cmd>lua require('telescope.builtin').keymaps()<cr>",
	["<leader>fc"]  = "<cmd>lua require('telescope.builtin').colorscheme()<cr>",
	["<leader>fo"]  = "<cmd>lua require('telescope.builtin').oldfiles()<cr>",
	["<leader>fq"]  = "<cmd>lua require('telescope.builtin').quickfix()<cr>",
	["<leader>fm"]  = "<cmd>lua require('telescope.builtin').marks()<cr>",
	["<leader>fre"] = "<cmd>lua require('telescope.builtin').resume()<cr>",
	["<leader>frg"] = "<cmd>lua require('telescope.builtin').registers()<cr>",

	-- SessionManager
	["<leader>sl"] = ":SessionManager load_session<cr>",
	["<leader>sd"] = ":SessionManager delete_session<cr>",

  -- Diffview
  ["<leader>do"] = ":DiffviewOpen<cr>",
  ["<leader>dc"] = ":DiffviewClose<cr>",

  -- Neogit
  ["<leader>ng"] = ":Neogit<cr>",
  ["<leader>nb"] = "<cmd>lua require('nabla').popup()<cr>"
}

local insert = {
	-- Insert mode:
	["<M-h>"] = "<Esc><c-w>h",
	["<M-j>"] = "<Esc><c-w>j",
	["<M-k>"] = "<Esc><c-w>k",
	["<M-l>"] = "<Esc><c-w>l",
}

local terminal = {
	-- Terminal mode:
	["<M-h>"] = "<c-\\><c-n><c-w>h",
	["<M-j>"] = "<c-\\><c-n><c-w>j",
	["<M-k>"] = "<c-\\><c-n><c-w>k",
	["<M-l>"] = "<c-\\><c-n><c-w>l",
	["<ESC><ESC>"] = "<C-\\><C-N>",
}

local visual = {
  -- Leap
  ["x"] = "<Plug>(leap-forward-x)",
  ["X"] = "<Plug>(leap-backward-x)",

  -- -- Hop
  -- ["<leader>e"] = "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>",

  -- Clever F
  [";"] = "<Plug>(clever-f-repeat-forward)",
  [","] = "<Plug>(clever-f-repeat-back)",

  -- open URL without netrw
  ["gx"] = "<Plug>(openbrowser-smart-search)",

	["<M-h>"] = "<Esc><c-w>h",
	["<M-j>"] = "<Esc><c-w>j",
	["<M-k>"] = "<Esc><c-w>k",
	["<M-l>"] = "<Esc><c-w>l",

  -- Move.nvim
  ["<C-Up>"] = ":MoveBlock(-1)<CR>",
  ["<C-Down>"] = ":MoveBlock(1)<CR>",
  ["<C-Left>"] = ":MoveHBlock(-1)<CR>",
  ["<C-Right>"] = ":MoveHBlock(1)<CR>",
}

local command = {}

for k, v in pairs(normal) do
	noremap("n", k, v)
end

for k, v in pairs(insert) do
	noremap("i", k, v)
end

for k, v in pairs(terminal) do
	noremap("t", k, v)
end

for k, v in pairs(visual) do
	noremap("v", k, v)
end

for k, v in pairs(command) do
	noremap("c", k, v)
end

-- Search visual mode
vim.cmd([[
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
]])
