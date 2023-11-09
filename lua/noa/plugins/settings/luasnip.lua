local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.set_config({
  store_selection_keys = '<c-s>',
})


ls.add_snippets(nil, {
  all = {},
  markdown = {
    snip({
      trig = "link",
      namr = "markdown_link",
      dscr = "Create markdown link [txt](url)"
    }, {
      text('['),
      insert(1),
      text(']('),
      func(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      text(')'),
      insert(0),
    })
  }
})


-- 	"(": {
-- 		"prefix": "@(",
-- 		"body": "\\left(${1:${TM_SELECTED_TEXT}}\\right",
-- 		"description": "left( ... right)"
-- 	},
--
-- 	"{": {
-- 		"prefix": "@{",
-- 		"body": "\\left\\{${1:${TM_SELECTED_TEXT}}\\right\\",
-- 		"description": "left{ ... right)"
-- 	},
--
-- 	"[": {
-- 		"prefix": "@[",
-- 		"body": "\\left[${1:${TM_SELECTED_TEXT}}\\right",
-- 		"description": "left[ ... right)"
-- 	},
--
--   "DeclareAcronym": {
--     "prefix": "\\DeclareAcronym",
--     "body": "\\DeclareAcronym{$1}{%\n\tshort = $2,\n\tlong = $3\n}",
--     "description": "Defines and acronym"
--   },
--
--   "Standalone class": {
--     "prefix": "standalone",
--     "body": "\\documentclass[tikz]{standalone}\n\n\n\\begin{document}\n\\begin{tikzpicture}\n$1\n\\end{tikzpicture}\n\\end{document}",
--     "description": "Standalone class template for TikZ"
--   },
--
--   "Table": {
--     "prefix": "table",
--     "body":[
--       "\\begin{table}",
--       "\t\\caption{tab:$4}%",
--       "\\label{$5}",
--       "\t\\begin{tabular}{$1}",
--       "\t\t\\toprule",
--       "\t\t$2",
--       "\t\t\\midrule",
--       "\t\t$3",
--       "\t\t\\bottomrule",
--       "\t\\end{tabular}",
--       "\\end{table}",
--       "$0"
--     ],
--     "description": "Default table with booktabs format"
--   },
--
--   "Figure": {
--   "prefix": "figure",
--   "body": [
--     "\\begin{figure}",
--     "\t\\includegraphics[width=0.7\\linewidth]{figuras/$1}",
--     "\t\\caption{$2}%",
--     "\t\\label{fig:$3}",
--     "\\end{figure}",
--     "$0"
--   ],
--   "description": "Default figure format"
--   },
-- }
--
