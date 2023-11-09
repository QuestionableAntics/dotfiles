local M = {}

M.open = function()
	local bufnr = vim.api.nvim_create_buf(false, false)

	-- focus buffer
	vim.api.nvim_set_current_buf(bufnr)
end

return M
