local M = {}

GitarState = {}

local COMMIT_MESSAGE_HEADER = {
	"Commit Message",
	"--------------",
}

local TO_COMMIT_HEADER = {
	"To Commit",
	"--------------",
}

local STAGED_HEADER = {
	"Staged",
	"--------------",
}

local UNSTAGED_HEADER = {
	"Unstaged",
	"--------------",
}

function M.get_git_current_state()
	local staged_content = vim.fn.systemlist('git diff --name-only --cached')
	local unstaged_content = vim.fn.systemlist('git diff --name-only')
	-- local to_commit_content = vim.fn.systemlist('git ls-files --others --exclude-standard')

	return {
		staged = staged_content,
		unstaged = unstaged_content,
		-- to_commit = to_commit_content,
	}
end


function M.save()
	local bufnr = vim.api.nvim_get_current_buf()
	local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	local commit_message = {}
	local to_commit = {}
	local staged = {}
	local unstaged = {}

	local current_section = 'Commit Message'

	-- for in through every entry in order in content
	for i, line in ipairs(content) do
		if line == '--------------' then
			current_section = content[i - 1]
		-- if the trimmed current line is empty, skip
		elseif line:match("^%s*(.-)%s*$") == '' then
			line = ''
		elseif current_section == 'To Commit' then
			table.insert(to_commit, line)
		elseif current_section == 'Staged' then
			table.insert(staged, line)
		elseif current_section == 'Unstaged' then
			table.insert(unstaged, line)
		end
	end

	local commit_message_string = table.concat(commit_message, '\n')
	local to_commit_string = table.concat(to_commit, ' ')
	local staged_string = table.concat(staged, ' ')
	local unstaged_string = table.concat(unstaged, ' ')

	local to_commit_command = 'git add ' .. to_commit_string
	local staged_command = 'git add ' .. staged_string
	local unstaged_command = 'git restore ' .. unstaged_string
	local commit_command = 'git commit ' .. to_commit_string .. '-m "' .. commit_message_string .. '"'

	print(to_commit_command)
	print(staged_command)
	print(unstaged_command)
	print(commit_command)

	-- vim.fn.system(to_commit_command)
	-- vim.fn.system(staged_command)
	-- vim.fn.system(unstaged_command)
	--
	-- vim.fn.system(commit_command)

	-- vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, GitarState.initial_content)
end


function M.open()
	local bufnr = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_buf_set_name(bufnr, 'Gitar')

    -- set buffer filetype
    vim.api.nvim_buf_set_option(bufnr, 'filetype', 'Gitar')
	vim.api.nvim_buf_set_option(bufnr, 'buftype', 'acwrite')

	local git_current_state = M.get_git_current_state()

	local content = vim.tbl_flatten({
		COMMIT_MESSAGE_HEADER,
		{''},
		{''},
		TO_COMMIT_HEADER,
		-- to_commit_content,
		{''},
		{''},
		STAGED_HEADER,
		git_current_state.staged_content,
		{''},
		{''},
		UNSTAGED_HEADER,
		git_current_state.unstaged_content,
	})

	GitarState.initial_content = content

	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, content)

	-- overwrite save
	vim.keymap.set('n', 'w', M.save, { noremap = true, silent = true, buffer = bufnr })

	-- focus buffer
	vim.api.nvim_set_current_buf(bufnr)
end

function M.setup(opts)
	M.opts = opts or {}

	vim.api.nvim_set_hl(0, 'CommitMessageHeader', { fg = "#32a852" })
	vim.api.nvim_set_hl(0, 'ToCommitHeader', { fg = "#32a852" })
	vim.api.nvim_set_hl(0, 'StagedHeader', { fg = "#32a852" })
	vim.api.nvim_set_hl(0, 'UnstagedHeader', { fg = "#32a852" })

	vim.cmd('syntax match CommitMessageHeader /^Commit Message$/')
	vim.cmd('syntax match ToCommitHeader /^To Commit$/')
	vim.cmd('syntax match StagedHeader /^Staged$/')
	vim.cmd('syntax match UnstagedHeader /^Unstaged$/')

	-- autocommand to handle buftype acwrite
	vim.api.nvim_create_autocmd(
		"BufWriteCmd",
		{
			pattern = {"Gitar"},
			callback = function() M.save() end,
		}
	)
end

return M
