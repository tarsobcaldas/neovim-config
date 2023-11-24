local rt = require("rust-tools")
local on_attach = require("noa.lsp.handlers").on_attach

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  tools = {
    executor = require("rust-tools.executors").toggleterm
  }
})
