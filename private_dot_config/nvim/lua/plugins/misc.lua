return {
	-- Speed up
	'nathom/filetype.nvim',

	-- Hints for keybindings
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
	},

	-- Types for vim api
	{
		'folke/neodev.nvim',
		event = 'VeryLazy',
	},

	---- General dependencies
	-- popup window interface
	'nvim-lua/popup.nvim',

	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"rcarriga/nvim-notify",
		},
		opts = {
			lang = "python3",
			sql = "postgresql",
			arg = "leetcode.nvim",
		},
		lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
	},

	-- obsidian
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		event = function()
			local parent_directory = vim.fn.expand '~' .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents'

			local events = {
				"BufReadPre " .. parent_directory .. "/**/*.md",
				"BufNewFile " .. parent_directory .. "/**/*.md",
			}

			return events
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = function()
			local parent_directory = vim.fn.expand '~' .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents'

			local sub_directories = vim.fn.globpath(parent_directory, '*', true, true)

			local workspaces = {}

			for _, directory in ipairs(sub_directories) do
				table.insert(
					workspaces,
					{
						name = directory,
						path = parent_directory .. '/' .. directory,
					}
				)
			end

			return {
				workspaces = workspaces,
				completion = { nvim_cmp = false },
				overwrite_mappings = true,
			}
		end,
		keys = {
			{
				'<Leader>gd',
				function() require('obsidian').util.gf_passthrough() end,
				desc = 'Go to file in Obsidian'
			},
		},
		-- disabled until multi vault support
		-- https://github.com/epwalsh/obsidian.nvim/pull/155
		-- enabled = false
	}
}
