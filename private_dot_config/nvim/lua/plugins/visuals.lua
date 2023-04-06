return {
	-- More pretty icons
	'kyazdani42/nvim-web-devicons',

	-- highlight matching html tags
	'gregsexton/MatchTag',

	-- VS Code theme
	{ 'Mofiqul/vscode.nvim',
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
	{ 'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
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
	{ 'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('indent_blankline').setup {
				show_current_context = true,
				show_current_context_start = true,
			}
		end
	},

	-- A ton of pretty UI things
	{ 'folke/noice.nvim',
		config = function()
			require('noice').setup()
			require('notify').setup { background_colour = '#000000' }
		end,
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		}
	},

	-- Pretty LSP interface
	{ 'glepnir/lspsaga.nvim',
		event = 'BufRead',
		config = function()
			require('lspsaga').setup({})
		end,
	},
}
