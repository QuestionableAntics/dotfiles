return {
	-- git in vim (required for other git plugins)
	'tpope/vim-fugitive',

	-- sign column symbols for git changes and git hunk actions
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup {
				current_line_blame = true,
				current_line_blame_opts = { delay = 200, },
			}
		end,
		keys = {
			{
				']c',
				function() require('gitsigns').next_hunk() end,
				desc = 'Next hunk'
			},
			{
				'[c',
				function() require('gitsigns').prev_hunk() end,
				desc = 'Previous hunk'
			},
			{
				'<Leader>hs',
				function() require('gitsigns').stage_hunk() end,
				desc = 'Stage hunk'
			},
			{
				'<Leader>hu',
				function() require('gitsigns').undo_stage_hunk() end,
				desc = 'Undo stage hunk'
			},
			{
				'<Leader>hr',
				function() require('gitsigns').reset_hunk() end,
				desc = 'Reset hunk'
			},
			{
				'<Leader>hR',
				function() require('gitsigns').reset_buffer() end,
				desc = 'Reset buffer'
			},
			{
				'<Leader>hp',
				function() require('gitsigns').preview_hunk() end,
				desc = 'Preview hunk'
			},
			{
				'<Leader>hb',
				function() require('gitsigns').blame_line { full = true } end,
				desc = 'Blame line'
			},
			{
				'<Leader>hS',
				function() require('gitsigns').stage_buffer() end,
				desc = 'Stage buffer'
			},
			{
				'<Leader>hU',
				function() require('gitsigns').reset_buffer_index() end,
				desc = 'Reset buffer index'
			},
		}
	},
}
