require("noa.settings")
require("noa.plugins")
require("noa.mappings")
require("noa.lsp")


local function source_files_from_dir(directory)
  for _, file in pairs(vim.fn.readdir(directory)) do
    local file = directory .. '/' .. file
    if vim.fn.filereadable(file) then
      vim.fn.execute('source ' .. file)
    end
  end
end

-- load all additional configs
local lua_config_dir = vim.fn.stdpath('config') .. '/lua/noa/'
local config_dirs = { 'plugins', 'lsp/settings' }

for _, dir in pairs(config_dirs) do
  source_files_from_dir(lua_config_dir .. '/' .. dir)
end
