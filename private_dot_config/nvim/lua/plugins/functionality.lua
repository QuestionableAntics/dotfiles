return {
	-- Interact with file system like a buffer
	{
		'stevearc/oil.nvim',
		config = function()
			require('oil').setup {
				view_options = { show_hidden = true },
			}
		end,
		keys = {
			{
				'<Leader>v',
				function() require('oil').open() end,
				desc = 'Open File Explorer',
			}
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = true,
	},

	-- Fast Motions
	{
		"folke/flash.nvim",
		modes = { search = { enabled = false } },
		label = {
			rainbow = {
				enabled = true,
				shade = 9
			}
		},
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
		lazy = true,
	},

	-- Additional treesitter functionality (in/around function/class/etc. operations)
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		event = 'VeryLazy',
	},

	-- Better Quickfix
	{
		'kevinhwang91/nvim-bqf',
		config = function() require('bqf').setup {} end,
		event = 'VeryLazy',
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
		keys = function()
			local Terminal = require('toggleterm.terminal').Terminal

			local horizontal = Terminal:new({ direction = 'horizontal' })
			local lazydocker = Terminal:new({ cmd = 'lazydocker', hidden = true, direction = 'float' })
			local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' })
			local float = Terminal:new({ direction = 'float' })

			return {
				{
					'<Leader>tt',
					function() horizontal:toggle() end,
					desc = 'Toggle terminal',
					mode = { 'n' },
				},
				{
					'<Leader>td',
					function() lazydocker:toggle() end,
					desc = 'Toggle lazydocker',
					mode = { 'n' },
				},
				{
					'<Leader>tg',
					function() lazygit:toggle() end,
					desc = 'Toggle lazygit',
					mode = { 'n' },
				},
				{
					'<C-v>',
					function() float:toggle() end,
					desc = 'Toggle float terminal',
					mode = { 'n', 't' },
				}
			}
		end,
		config = true,
		lazy = true,
	},

	-- local plugin 
	{
		name = 'judge.nvim',
		dir = '~/.config/nvim/lua/custom-plugins/judge',
		dev = true,
		config = function()
			require('custom-plugins.judge').setup({
				ignored_directories = {
					vim.fn.expand("$HOME"),
				},
				ignored_buffer_patterns = {
					"oil://",
				}
			})
		end,
		keys = function()
			local judge = require('custom-plugins.judge')

			return {
				{
					'<Leader>sd',
					judge.delete_session,
					desc = 'Delete session',
					mode = { 'n' },
				},
				{
					'<Leader>ss',
					judge.save_session,
					desc = 'Save session',
					mode = { 'n' },
				},
				{
					'<Leader>sl',
					judge.go_to_previous_session,
					desc = 'Load previous session',
					mode = { 'n' },
				},
				{
					'<Leader>fd',
					judge.search_switch_sessions,
					desc = 'Search sessions',
					mode = { 'n' },
				}
			}
		end,
		lazy = false,
		enabled = not Database
	},

	-- local plugin
	{
		name = 'gitar.nvim',
		dir = '~/.config/nvim/lua/custom-plugins/gitar',
		dev = true,
		config = function()
			require('custom-plugins.gitar').setup()
		end,
		keys = function()
			local gitar = require('custom-plugins.gitar')

			return {
				{
					'<Leader>gf',
					gitar.open,
					desc = 'Open Gitar',
					mode = { 'n' },
				},
			}
		end,
		lazy = false,
	},

	-- stupid easy indentation
	-- {
	-- 	'https://github.com/Darazaki/indent-o-matic',
	-- 	config = function() require('indent-o-matic').setup {} end,
	-- 	event = "VeryLazy",
	-- },
}
