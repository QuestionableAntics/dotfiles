return {
	-- Pretty Pick List
	{ 'nvim-telescope/telescope.nvim',
		dependencies = {
			-- rg raw live grep
			'nvim-telescope/telescope-live-grep-args.nvim',
		},
	},

	-- Telescope fzf integration
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

	-- dap integration
	'nvim-telescope/telescope-dap.nvim',

	-- Uses telescope for the native ui-select
	'nvim-telescope/telescope-ui-select.nvim',

	-- ,
}
