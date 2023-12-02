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
		map_opts = M.merge_tables({ map_opts, { noremap = true, silent = true } })
	end

	if type(modes) == "string" then
		modes = { modes }
	end

	for _, mode in ipairs(modes) do
		vim.keymap.set(mode, shortcut, command, map_opts)
	end
end

function M.get_hlgroup(name, fallback)
	if vim.fn.hlexists(name) == 1 then
		local hl
		if vim.api.nvim_get_hl then -- check for new neovim 0.9 API
			hl = vim.api.nvim_get_hl(0, { name = name, link = false })
			if not hl.fg then
				hl.fg = "NONE"
			end
			if not hl.bg then
				hl.bg = "NONE"
			end
		else
			hl = vim.api.nvim_get_hl_by_name(name, vim.o.termguicolors)
			if not hl.foreground then
				hl.foreground = "NONE"
			end
			if not hl.background then
				hl.background = "NONE"
			end
			hl.fg, hl.bg = hl.foreground, hl.background
			hl.ctermfg, hl.ctermbg = hl.fg, hl.bg
			hl.sp = hl.special
		end
		return hl
	end
	return fallback or {}
end

return M
