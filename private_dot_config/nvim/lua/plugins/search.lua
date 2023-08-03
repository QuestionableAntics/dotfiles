return {
	-- Pretty Pick List
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			-- rg raw live grep
			'nvim-telescope/telescope-live-grep-args.nvim',
		},
	},

	-- Telescope fzf integration
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
	},

	-- Uses telescope for the native ui-select
	'nvim-telescope/telescope-ui-select.nvim',

	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		config = function()
			require("telescope").load_extension("smart_open")
			-- require("telescope").extensions.smart_open.smart_open {
			-- 	cwd_only = true,
			-- }
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	'Marskey/telescope-sg',

	'nvim-telescope/telescope-fzy-native.nvim',
}
