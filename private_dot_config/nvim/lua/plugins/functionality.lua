return {
	-- Interact with file system like a buffer
	{
		'stevearc/oil.nvim',
		opts = {},
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
		event = 'VeryLazy',
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
		event = "VeryLazy",
	},

	-- Additional treesitter functionality (in/around function/class/etc. operations)
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		event = 'VeryLazy',
	},

	-- Session Management
	{
		'rmagatti/auto-session',
		config = function()
			require('auto-session').setup {
				auto_session_root_dir = os.getenv('HOME') .. '/.vim/sessions/',
				auto_session_suppress_dirs = { os.getenv('HOME') },
			}
		end
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
		event = 'VeryLazy',
	},

	-- {
	-- 	"arnaupv/nvim-devcontainer-cli",
	-- 	opts = {}
	-- },

	-- Open paired files
	-- {
	-- 	'rgroli/other.nvim',
	-- 	config = function() require('other-nvim').setup {} end
	-- },

	{
		"harrisoncramer/gitlab.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
			enabled = true,
		},
		build = function() require("gitlab.server").build(true) end, -- Builds the Go binary
		config = function()
			require("gitlab").setup()                          -- Uses delta reviewer by default
		end,
		event = "VeryLazy",
		enabled = false,
	},

	-- {
	-- 	'Wansmer/symbol-usage.nvim',
	-- 	event = 'LspAttach',
	-- 	config = function()
	-- 		require('symbol-usage').setup()
	-- 	end
	-- },

	-- stupid easy indentation
	{
		'https://github.com/Darazaki/indent-o-matic',
		config = function() require('indent-o-matic').setup {} end,
		event = "VeryLazy",
	},
}
