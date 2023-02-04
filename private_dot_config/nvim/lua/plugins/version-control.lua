return {
	-- git in vim (required for other git plugins)
	'tpope/vim-fugitive',

	-- sign column symbols for git changes and git hunk actions
	{ 'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup {
				current_line_blame = true,
				current_line_blame_opts = { delay = 200, },
			}
		end,
	},

	-- git commit browser
	'junegunn/gv.vim',

	-- Diff View
	{ 'sindrets/diffview.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
	},
}
