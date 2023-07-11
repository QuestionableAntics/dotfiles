return {
	-- File Explorer
	{
		"lmburns/lf.nvim",
		config = function()
			-- This feature will not work if the plugin is lazy-loaded
			vim.g.lf_netrw = 1

			require("lf").setup({
				escape_quit = false,
				border = "rounded",
				-- highlights = {FloatBorder = {guifg = require("kimbox.palette").colors.magenta}}
			})
		end,
		dependencies = { "plenary.nvim", "toggleterm.nvim" }
	},

	-- Fast Motions
	{
		"folke/flash.nvim",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				-- default options: exact mode, multi window, all directions, with a backdrop
				function() require("flash").jump() end,
			},
			{
				"S",
				mode = { "o", "x" },
				function() require("flash").treesitter() end,
			},
			{
				"r",
				mode = "o",
				function() require("flash").remote() end,
				desc = "Remote Flash",
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

	{
		"arnaupv/nvim-devcontainer-cli",
		opts = {}
	},

	-- Open paired files
	-- {
	-- 	'rgroli/other.nvim',
	-- 	config = function() require('other-nvim').setup {} end
	-- }
}
