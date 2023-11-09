local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')


local cond = require('nvim-autopairs.conds')

npairs.add_rules({
	Rule("(", ")", {"tex", "latex"})
    :with_pair(cond.not_before_text("\\"))
    :with_pair(cond.not_before_text("@"))
})

npairs.add_rules({
	Rule("\\(", "\\)", {"tex", "latex"})
})

npairs.add_rules({
	Rule("\\[", "\\]", {"tex", "latex"})
})

npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
})

npairs.add_rules({
	Rule("$$", "$$", {"tex", "latex", "plaintex"})
})

npairs.add_rules({
	Rule("\\left(", "\\right)", {"tex", "latex"})
	:with_pair(cond.not_before_text("\\"))
})

-- npairs.add_rules({
-- 	Rule('"', '"', {"tex", "latex", "plaintex"})
-- 	:with_pair(cond.not_after_regex_check("\\"))
-- })

-- npairs.add_rules({
-- 	Rule("'", "'", {"tex", "latex", "plaintex"})
-- 	:with_pair(cond.not_after_regex_check("\\"))
-- })


    -- -- don't add a pair if the next character is %
    -- :with_pair(cond.not_after_regex_check("%%"))
    -- -- don't add a pair if  the previous character is xxx
    -- :with_pair(cond.not_before_regex_check("xxx", 3))
    -- -- don't move right when repeat character
    -- :with_move(cond.none())
    -- -- don't delete if the next character is xx
    -- :with_del(cond.not_after_regex_check("xx"))
    -- -- disable adding a newline when you press <cr>
    -- :with_cr(cond.none())

  -- }
-- )


-- npairs.add_rules({
--   Rule("$$","$$","tex")
--     :with_pair(function(opts)
--         print(vim.inspect(opts))
--         if opts.line=="aa $$" then
--         -- don't add pair on that line
--           return false
--         end
--     end)
--    }
-- )
