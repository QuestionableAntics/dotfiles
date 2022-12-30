-- Highlight yanked text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank() end,
	group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
	pattern = '*',
})


-- Check if file changed outside vim & re-read file
-- Also not working currently, but it used to, so who knows what's up
-- vim.api.nvim_create_autocmd('FocusGained', {
-- 	group = vim.api.nvim_create_augroup('Reload', { clear = true }),
-- 	callback = function()
-- 		vim.cmd [[silent! noautocmd checktime]]
-- 	end,
-- 	pattern = '*',
-- })


-- Check if we need to reload the file when it changed
vim.cmd('au FocusGained * :checktime')

-- Run lint on save
-- vim.api.nvim_create_autocmd('BufWritePre', {
-- 	callback = function()
-- 		vim.cmd [[ EslintFixAll ]]
-- 	end,
-- 	group = vim.api.nvim_create_augroup('Lint', { clear = true }),
-- 	pattern = '*',
-- })


-- show cursor line only in active window
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
