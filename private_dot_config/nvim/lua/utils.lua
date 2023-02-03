local cmd = vim.cmd

local M = {}

M.merge_tables = function(tables)
	local new_table = {}

	for _, table in ipairs(tables) do
		for key, value in pairs(table) do
			new_table[key] = value
		end
	end

	return new_table
end

M.base_map = function(modes, shortcut, command, opts, map_opts)
	opts = opts or {}
	map_opts = map_opts or {}

	if opts.disable == true then
		return
	end

	if not opts.override then
		map_opts = M.merge_tables { map_opts, { noremap = true, silent = true } }
	end

	if type(modes) == "string" then
		modes = { modes }
	end

	for _, mode in ipairs(modes) do
		vim.keymap.set(mode, shortcut, command, map_opts)
	end
end

return M
