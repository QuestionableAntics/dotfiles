return {
	-- More pretty icons
	'nvim-tree/nvim-web-devicons',

	-- highlight matching html tags
	'gregsexton/MatchTag',

	-- VS Code theme
	{
		'Mofiqul/vscode.nvim',
		config = function()
			local vscode = require('vscode')
			vscode.setup {
				transparent = true,
				italic_comments = true,
			}
			vscode.load()
		end,
	},

	-- Nice status bar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				options = { theme = require('lualine.themes.onedark') },
				sections = {
					lualine_a = {
						{ 'filename', path = 1 },
					},
				},
			}
		end,
	},

	-- Virtual text to add indentation guides
	{
		'shellRaining/hlchunk.nvim',
		event = { 'UIEnter' },
		config = function()
			require('hlchunk').setup({
				indent = { chars = { '┆' } },
				blank = { enable = false }
			})
		end,
	},

	-- A ton of pretty UI things
	{
		'folke/noice.nvim',
		config = function()
			require('noice').setup()
			require('notify').setup { background_colour = '#000000' }
		end,
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		}
	},

	-- VS Code style references view
	{
		'DNLHC/glance.nvim',
		config = function() require('glance').setup({}) end,
	},
}
