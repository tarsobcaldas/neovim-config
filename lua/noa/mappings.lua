local opts = { noremap = true, silent = true }

local function map(mode, shortcut, command, options)
  vim.keymap.set(mode, shortcut, command, options)
end

local function noremap(mode, shortcut, command)
  map(mode, shortcut, command, opts)
end

local normal_mappings = {
  -- Leap

  ["]b"] = "<cmd>BufferLineCycleNext<cr>",
  ["[b"] = "<cmd>BufferLineCyclePrev<cr>",

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

  -- Quickfix
  ["<C-j>"] = ":cnext<cr>",
  ["<C-k>"] = ":cprevious<cr>",
  ["<leader>qf"] = ":copen<cr>",

  -- add empty lines
  ["[<space>"] = "<cmd>put! =repeat(nr2char(-10), v:count-1)<cr>",
  ["]<space>"] = "<cmd>put =repeat(nr2char(10), v:count1)<cr>",

  -- Use cd to change to current folder
  ["<leader>cd"] = ":cd %:p:h<CR>:pwd<CR>",

  -- Use cd to change to current folder
  ["<leader>hs"] = ":sp<CR>",
  ["<leader>vs"] = ":vsp<CR>",

  -- Manipulate buffers
  ["<leader><"]  = "<cmd>BufferLineMovePrev<cr>",
  ["<leader>>"]  = "<cmd>BufferLineMoveNext<cr>",

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

  ["<A-;>"] = "::",
  ["<A-,>"] = "<<",
  ["<A-.>"] = ">>"
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
