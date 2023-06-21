return {
	-- Ranger integration
	{
		'kevinhwang91/rnvimr',
		config = function()
			vim.g.rnvimr_ranger_cmd = {
				'ranger',
				'--cmd=set draw_borders both',
				'--cmd=set show_hidden true',
			}
			vim.g.rnvimr_enable_picker = 1
			vim.g.rnvimr_enable_ex = 1
		end,
	},

	-- Fast Motions
	{
		"folke/flash.nvim",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					-- default options: exact mode, multi window, all directions, with a backdrop
					require("flash").jump()
				end,
			},
			{
				"S",
				mode = { "o", "x" },
				function()
					require("flash").treesitter()
				end,
			},
		},
	},

	-- Additional treesitter functionality (in/around function/class/etc. operations)
	'nvim-treesitter/nvim-treesitter-textobjects',

	-- Session Management
	{
		'rmagatti/auto-session',
		config = function()
			require('auto-session').setup {
				auto_session_root_dir = os.getenv('HOME') .. '/.vim/sessions/',
				auto_session_suppress_dirs = { '~/' },
			}
		end
	},

	-- Better Quickfix
	{
		'kevinhwang91/nvim-bqf',
		config = function() require('bqf').setup {} end
	},

	-- Tabline
	{
		'nanozuki/tabby.nvim',
		config = function() require('tabby').setup {} end
	},

	-- Better terminal (opens terminal with command, floating buffers)
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		config = true
	},

	-- Open paired files
	-- {
	-- 	'rgroli/other.nvim',
	-- 	config = function() require('other-nvim').setup {} end
	-- }
}
