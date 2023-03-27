local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command)
end

local cmp = require("cmp")
local options = {
  -- tabstop = 4,
  -- shiftwidth = 4
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[set iskeyword-=:-]])

require('cmp').setup.buffer {
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        omni = "[VimTeX]",
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        latex_symbols = "[Symbol]",
        path = "[Path]",
        luasnip = "[Snippet]",
        -- formatting for other sources
      })[entry.source.name]
      return vim_item
    end,
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = 'omni' },
    { name = 'buffer' },
    { name = "path" },
    { name = "latex_symbols" },
    -- other sources
  }),
}

require('nabla').disable_virt()

map("n", "]e", "<Plug>(vimtex-]m)")
map("n", "[e", "<Plug>(vimtex-[m)")


-- local knap_mapping = {
--   ["<leader>lc"] = function() require("knap").process_once() end,
--   ["<leader>lx"] = function() require("knap").close_viewer() end,
--   ["<leader>ll"] = function() require("knap").toggle_autopreviewing() end,
--   ["<leader>lv"] = function() require("knap").forward_jump() end,
-- }

-- for k, v in pairs(knap_mapping) do
--   map({ 'n', 'v', 'i' }, k, v)
-- end

-- local knap_settings = {
--   textopdf = "lualatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
--   textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
--   textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%"
--   -- mdtopdfviewerlaunch = "llpp %outputfile%",
--   -- mdtopdfviewerrefresh = "kill -HUP %pid%",
--   -- markdowntopdfviewerlaunch = "llpp %outputfile%",
--   -- markdowntopdfviewerrfresh = "kill -HUP %pid%",
--   -- textopdfviewerlaunch = "PIPE=$XDG_RUNTIME_DIR/llpp-remote.pipe ; ([[ -p $PIPE ]] || mkfifo -m 600 $PIPE) && exec llpp -remote $PIPE %outputfile%",
--   -- textopdfviewerrefresh = "(echo reload > $XDG_RUNTIME_DIR/llpp-remote.pipe)",
--   -- textopdfforwardjump = "synctex view -i %line%:%column%:%srcfile% -o %outputfile% -x \"echo goto %{page} %{h} %{v} > $XDG_RUNTIME_DIR/llpp-remote.pipe\""
-- }

-- vim.g.knap_settings = knap_settings
