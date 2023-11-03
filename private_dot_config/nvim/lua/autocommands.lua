------------------------------------------------------------------------------------------
-- Other
------------------------------------------------------------------------------------------

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


-- Go to last location when opening a buffer
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


-- Format go files on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function() require('go.format').goimport() end,
	group = vim.api.nvim_create_augroup("GoFormat", {}),
})


-- Write session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local cwd = vim.fn.getcwd()

		-- if home dir, don't save session
		if cwd == vim.fn.expand("$HOME") then return end

		-- save session to ~/.nvim/sessions
		local session_dir = vim.fn.expand("$HOME/.nvim/sessions")
		local session_file = session_dir .. "/" .. vim.fn.fnamemodify(cwd, ":p:h:t") .. ".vim"
		vim.fn.mkdir(session_dir, "p")
		vim.cmd("mksession! " .. session_file)
	end,
})

-- Read session on start
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- if neovim was called with a path to a specifc file, don't load session
		if vim.fn.argc() > 0 then return end

		local cwd = vim.fn.getcwd()

		-- if home dir, don't save session
		if cwd == vim.fn.expand("$HOME") then return end

		-- save session to ~/.nvim/sessions
		local session_dir = vim.fn.expand("$HOME/.nvim/sessions")
		local session_file = session_dir .. "/" .. vim.fn.fnamemodify(cwd, ":p:h:t") .. ".vim"
		if vim.fn.filereadable(session_file) == 1 then
			vim.cmd("source " .. session_file)
		end
	end,
	nested = true,
})
