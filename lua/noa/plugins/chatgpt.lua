local status_ok = pcall(require, "nvim-gpt")
if not status_ok then
  return
end

local chatgpt = require("nvim-gpt")

chatgpt.setup({
  model = "balanced"
})
