-- Startup autocommands
vim.api.nvim_create_autocmd(
	"VimEnter",
	{ callback = function() vim.cmd [[ :COQnow ]] end }
)


-- Highlight yanked text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank() end,
	group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
	pattern = '*',
})


-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd(
	{
		"FocusGained",
		"TermClose",
		"TermLeave",
		"CursorHold",
		"InsertLeave",
		"WinEnter",
		"BufEnter",
		"BufWritePost",
		"BufWritePre",
		"BufReadPost",
		"BufReadPre",
	},
	{ command = "checktime" }
)


-- Run lint on save
-- vim.api.nvim_create_autocmd('BufWritePre', {
-- 	callback = function()
-- 		vim.cmd [[ EslintFixAll ]]
-- 	end,
-- 	group = vim.api.nvim_create_augroup('Lint', { clear = true }),
-- 	pattern = '*',
-- })


-- Show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
		if ok and cl then
			vim.wo.cursorline = true
			vim.api.nvim_win_del_var(0, "auto-cursorline")
		end
	end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		local cl = vim.wo.cursorline
		if cl then
			vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
			vim.wo.cursorline = false
		end
	end,
})


-- Resize splits if window was resized
vim.api.nvim_create_autocmd(
	{ "VimResized" },
	{ callback = function() vim.cmd("tabdo wincmd =") end }
)


-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)

		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})


-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})


-- On TermEnter, set term able to be killed by wqa
-- vim.api.nvim_create_autocmd("TermOpen",  {
-- 	callback = function()
-- 		vim.cmd [[
-- 			command Z wa | qa silent
-- 			cabbrev wqa Z
-- 		]]
-- 	end
-- })


-- Show code action lightbulb on cursorhold
local lightbulb = require('nvim-lightbulb')
vim.api.nvim_create_autocmd({"CursorHold, CursorHoldI"}, {
	callback = lightbulb.update_lightbulb
})


-- Unmap jk in ranger buffer
vim.api.nvim_create_autocmd("Filetype", {
	pattern = { "rnvimr" },
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "t", "j", "j", {noremap = true, silent = true, nowait = true})
	end
})
