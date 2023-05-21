local opts = { noremap = true, silent = true }

local function map(mode, shortcut, command, options)
  vim.keymap.set(mode, shortcut, command, options)
end

local function noremap(mode, shortcut, command)
  map(mode, shortcut, command, opts)
end

local normal_mappings = {
  -- -- Clever F
  -- [";"] = "<Plug>(clever-f-repeat-forward)",
  -- [","] = "<Plug>(clever-f-repeat-back)",

  -- Leap
  ["t"] = "<Plug>(leap-forward)",
  ["T"] = "<Plug>(leap-backward)",

  -- open URL without netrw
  ["gx"] = "<Plug>(openbrowser-smart-search)",

  ["]b"] = "<cmd>BufferLineCycleNext<cr>",
  ["[b"] = "<cmd>BufferLineCyclePrev<cr>",

  -- Gitsigns
  ["]g"]          = ":Gitsigns next_hunk<cr>",
  ["[g"]          = ":Gitsigns prev_hunk<cr>",
  ["<leader>sh"]  = ":Gitsigns stage_hunk<cr>",
  ["<leader>rh"]  = ":Gitsigns reset_hunk<cr>",
  ["<leader>sb"]  = ":Gitsigns stage_buffer<cr>",
  ["<leader>ph"]  = ":Gitsigns preview_hunk<cr>",
  ["<leader>gb"]  = ":Gitsigns blame_line<cr>",
  ["<leader>gd"]  = ":Gitsigns diffthis<cr>",
  ["<leader>gqf"] = ":Gitsigns setqflist<cr>",

  -- Git conflict
  ["]x"] = "<Plug>(git-conflict-prev-conflict)",
  ["[x"] = "<Plug>(git-conflict-next-conflict)",
  ["<leader>co"] = "<Plug>(git-conflict-ours)",
  ["<leader>ct"] = "<Plug>(git-conflict-theirs)",
  ["<leader>cb"] = "<Plug>(git-conflict-both)",
  ["<leader>c0"] = "<Plug>(git-conflict-none)",
  ["<leader>cqf"] = ":GitCoflictListQf<cr>",

  -- Move through windows
  ["<M-h>"] = "<c-w>h",
  ["<M-j>"] = "<c-w>j",
  ["<M-k>"] = "<c-w>k",
  ["<M-l>"] = "<c-w>l",

  -- Mouse
  ["<X1Mouse>"] = "<C-O>",
  ["<X2Mouse>"] = "<C-I>",
  ["<C-MiddleMouse>"] = "u",
  ["<A-MiddleMouse>"] = "<C-R>",

  -- Move.nvim
  ["<C-Up>"] = ":MoveLine(-1)<CR>",
  ["<C-Down>"] = ":MoveLine(1)<CR>",
  ["<C-Left>"] = ":MoveHChar(-1)<CR>",
  ["<C-Right>"] = ":MoveHChar(1)<CR>",

  -- Quickfix
  ["<C-j>"] = ":cnext<cr>",
  ["<C-k>"] = ":cprevious<cr>",
  ["<leader>qf"] = ":copen<cr>",

  -- add empty lines
  ["[<space>"] = "<cmd>put! =repeat(nr2char(-10), v:count-1)<cr>",
  ["]<space>"] = "<cmd>put =repeat(nr2char(10), v:count1)<cr>",

  ["<leader>ut"] = "<cmd>lua require('undotree').toggle()<cr>",

  -- Use cd to change to current folder
  ["<leader>cd"] = ":cd %:p:h<CR>:pwd<CR>",

  -- Use cd to change to current folder
  ["<leader>hs"] = ":sp<CR>",
  ["<leader>vs"] = ":vsp<CR>",

  -- Manipulate buffers
  ["<leader>xx"] = "<cmd>Bdelete<cr>",
  ["<leader>xf"] = "<cmd>Bdelete!<cr>",
  ["<leader>xa"] = "<cmd>BufOnly<cr>",
  ["<leader><"]  = "<cmd>BufferLineMovePrev<cr>",
  ["<leader>>"]  = "<cmd>BufferLineMoveNext<cr>",

  -- MarkdownPreview
  ["<leader>mt"] = "<Plug>MarkdownPreviewToggle",

  -- Trouble
  ["<leader>tt"] = "<cmd>TroubleToggle<cr>",
  ["<leader>tw"] = "<cmd>Trouble workspace_diagnostics<cr>",
  ["<leader>td"] = "<cmd>Trouble document_diagnostics<cr>",
  ["<leader>tl"] = "<cmd>Trouble loclist<cr>",
  ["<leader>tq"] = "<cmd>Trouble quickfix<cr>",
  ["<leader>tr"] = "<cmd>Trouble lsp_references<cr>",

  -- Telescope
  ["<leader>fs"]  = "<cmd>Telescope file_browser<cr>",
  ["<leader>ff"]  = "<cmd>lua require('telescope.builtin').find_files()<cr>",
  ["<leader>fg"]  = "<cmd>lua require('telescope.builtin').live_grep()<cr>",
  ["<leader>fb"]  = "<cmd>lua require('telescope.builtin').buffers()<cr>",
  ["<leader>fh"]  = "<cmd>lua require('telescope.builtin').help_tags()<cr>",
  ["<leader>fk"]  = "<cmd>lua require('telescope.builtin').keymaps()<cr>",
  ["<leader>fc"]  = "<cmd>lua require('telescope.builtin').colorscheme()<cr>",
  ["<leader>fo"]  = "<cmd>lua require('telescope.builtin').oldfiles()<cr>",
  ["<leader>fq"]  = "<cmd>lua require('telescope.builtin').quickfix()<cr>",
  ["<leader>pj"]  = "<cmd>lua require('telescope').extensions.project.project()<cr>",
  ["<leader>bb"]  = "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>",
  ["<leader>frp"] = "<cmd>lua require('telescope').extensions.repo.repo()<cr>",
  ["<leader>fre"] = "<cmd>lua require('telescope.builtin').resume()<cr>",
  ["<leader>frg"] = "<cmd>lua require('telescope.builtin').registers()<cr>",
  ["<leader>fmk"] = "<cmd>lua require('telescope.builtin').marks()<cr>",
  ["<leader>fmd"] = "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>",
  ["<leader>fpk"] = "<cmd>lua require('telescope').extensions.packer.packer()<cr>",
  ["<leader>fpi"] = "<cmd>lua require('telescope').extensions.find_pickers.find_pickers()<cr>",

  -- SessionManager
  ["<leader>sl"] = ":SessionManager load_session<cr>",
  ["<leader>sd"] = ":SessionManager delete_session<cr>",

  -- Diffview
  ["<leader>do"] = ":DiffviewOpen<cr>",
  ["<leader>dc"] = ":DiffviewClose<cr>",

  -- Neogit
  ["<leader>ng"] = ":Neogit<cr>",

  -- Nabla
  ["<leader>nb"] = "<cmd>lua require('nabla').popup()<cr>",

  -- Snippets
  ["<leader>es"] = "<cmd>lua require('luasnip.loaders').edit_snippet_files()",
}

-- Insert mode mappings
local insert_mappings = {
  -- Move through windows
  ["<M-h>"] = "<Esc><c-w>h",
  ["<M-j>"] = "<Esc><c-w>j",
  ["<M-k>"] = "<Esc><c-w>k",
  ["<M-l>"] = "<Esc><c-w>l",

  -- For fire.nvim
  ["<C-u>"] = "<C-w>",
}

-- Terminal mode mappings
local terminal_mappings = {
  -- Move through windows
  ["<M-h>"] = "<c-\\><c-n><c-w>h",
  ["<M-j>"] = "<c-\\><c-n><c-w>j",
  ["<M-k>"] = "<c-\\><c-n><c-w>k",
  ["<M-l>"] = "<c-\\><c-n><c-w>l",

  -- Leave Terminal Mode
  ["<ESC><ESC>"] = "<C-\\><C-N>",
}

-- Visual mode mappings
local visual_mappings = {
  -- Leap
  ["x"] = "<Plug>(leap-forward-x)",
  ["X"] = "<Plug>(leap-backward-x)",

  -- Clever F
  [";"] = "<Plug>(clever-f-repeat-forward)",
  [","] = "<Plug>(clever-f-repeat-back)",

  -- open URL without netrw
  ["gx"] = "<Plug>(openbrowser-smart-search)",

  -- Move through windows
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

-- Command mode mappings
local command_mappings = {
  ["<M-k>"] = "<C-p>",
  ["<M-j>"] = "<C-n>"
}


-- Make mappings take effect
for k, v in pairs(normal_mappings) do
  noremap("n", k, v)
end

for k, v in pairs(insert_mappings) do
  noremap("i", k, v)
end

for k, v in pairs(terminal_mappings) do
  noremap("t", k, v)
end

for k, v in pairs(visual_mappings) do
  noremap("v", k, v)
end

for k, v in pairs(command_mappings) do
  noremap("c", k, v)
end
