local opts = {noremap = true, silent = true}

local function map(mode, shortcut, command, options)
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

local function noremap(mode, shortcut, command)
  map(mode, shortcut, command, opts)
end

local normal = {
  -- Leap
  ["t"] = "<Plug>(leap-forward)",
  ["T"] = "<Plug>(leap-backward)",
}

vim.cmd[[
  unmap t
  unmap T
]]

for k, v in pairs(normal) do
	noremap("n", k, v)
end
