function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map("n", shortcut, command)
end

function imap(shortcut, command)
	map("i", shortcut, command)
end

function vmap(shortcut, command)
	map("v", shortcut, command)
end

function cmap(shortcut, command)
	map("c", shortcut, command)
end

function tmap(shortcut, command)
	map("t", shortcut, command)
end

-- Undo tree
nmap("<F5>", "<cmd>UndotreeToggle<cr>")

-- Use cd to change to current folder
nmap("<leader>cd", ":cd %:p:h<CR>:pwd<CR>")
-- Close current buffer

-- <c-n> and <c-n> behave the same as up and down arrows on command-line
-- vim.api.nvim_set_keymap("c", "<c-n>", "widmenumode() ? '\\<c-n>' : \\<down>'", { expr = true, noremap = true, silent = true})
-- vim.api.nvim_set_keymap("c", "<c-p>", "wildmenumode() ? '\\<c-p>' : \\<up>'", { expr = true, noremap = true, silent = true})

-- move line above or below
nmap("[e", "<cmd>execute 'move -1-'. v:count1<cr>")
nmap("]e", "<cmd>execute 'move +'. v:count1<cr>")

-- add empty lin"es"
nmap("[<space>", "<cmd>put! =repeat(nr2char(-10), v:count-1)<cr>")
nmap("]<space>", "<cmd>put =repeat(nr2char(10), v:count1)<cr>")

nmap("<Leader>xx", "<cmd>Bdelete<cr>")
nmap("<Leader>xf", "<cmd>Bdelete!<cr>")

nmap("]b", "<cmd>BufferLineCycleNext<cr>")
nmap("[b", "<cmd>BufferLineCyclePrev<cr>")

nmap("<space><", "<cmd>BufferLineMovePrev<cr>")
nmap("<space>>", "<cmd>BufferLineMoveNext<cr>")

-- Terminal mode:
tmap("<M-h>", "<c-\\><c-n><c-w>h")
tmap("<M-j>", "<c-\\><c-n><c-w>j")
tmap("<M-k>", "<c-\\><c-n><c-w>k")
tmap("<M-l>", "<c-\\><c-n><c-w>l")
tmap("<ESC><ESC>", "<C-\\><C-N>")

-- Insert mode:
imap("<M-h>", "<Esc><c-w>h")
imap("<M-j>", "<Esc><c-w>j")
imap("<M-k>", "<Esc><c-w>k")
imap("<M-l>", "<Esc><c-w>l")

-- Visual mode:
vmap("<M-h>", "<Esc><c-w>h")
vmap("<M-j>", "<Esc><c-w>j")
vmap("<M-k>", "<Esc><c-w>k")
vmap("<M-l>", "<Esc><c-w>l")

-- Normal mode:
nmap("<M-h>", "<c-w>h")
nmap("<M-j>", "<c-w>j")
nmap("<M-k>", "<c-w>k")
nmap("<M-l>", "<c-w>l")

nmap("<leader>mt", "<Plug>MarkdownPreviewToggle")

-- Quickfix
nmap("<C-j>", ":cnext<cr>")
nmap("<C-k>", ":cprevious<cr>")
nmap("<leader>qf", ":copen<cr>")

imap("<M-4>", "$")

-- Search visual mode
vim.cmd([[
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

]])

-- Trouble
nmap("<leader>tt", "<cmd>Trouble<cr>")
nmap("<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>")
nmap("<leader>td", "<cmd>Trouble document_diagnostics<cr>")
nmap("<leader>tl", "<cmd>Trouble loclist<cr>")
nmap("<leader>tq", "<cmd>Trouble quickfix<cr>")
nmap("gR", "<cmd>Trouble lsp_references<cr>")
