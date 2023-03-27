local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local luasnip_loaders = require("luasnip.loaders.from_vscode")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local super_tab_next = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local super_tab_previous = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end

local expand_snippet = function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
  end
end

local snippet_jump_back = function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
  end
end


cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      -- ["<C-g>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(super_tab_next, { "i", "s", "c" }),
        ["<S-Tab>"] = cmp.mapping(super_tab_previous, { "i", "s", "c" }),
        ["<C-l>"] = cmp.mapping(expand_snippet, { "i", "s" }),
        ["<C-o>"] = cmp.mapping(snippet_jump_back, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "omni" },
    { name = "buffer" },
    { name = "path" },
    { name = "emoji" },
    { name = "org" }
  }),

  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LSP]",
        luasnip = "[Snippet]",
        omni = "[Omnifunc]",
        path = "[Path]",
      },
    }),
  },

  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
      require("cmp-under-comparator").under,
    },
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

luasnip.config.setup({ history = false })

luasnip_loaders.lazy_load({})
