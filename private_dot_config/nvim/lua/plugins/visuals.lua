return {
	-- More pretty icons
	{
		'nvim-tree/nvim-web-devicons',
		event = 'VeryLazy',
	},

	-- highlight matching html tags
	{
		'gregsexton/MatchTag',
		ft = { 'html', 'xml', 'javascript', 'typescriptreact', 'javascriptreact' },
	},

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
		priority = 1000,
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
		event = 'VeryLazy',
	},

	-- Virtual text to add indentation guides
	{
		'shellRaining/hlchunk.nvim',
		event = { 'VeryLazy' },
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
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
			require('notify').setup { background_colour = '#000000' }
		end,
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
	},

	-- VS Code style references view
	{
		'DNLHC/glance.nvim',
		config = function()
			require('glance').setup({
				hooks = {
					before_open = function(results, open, jump, method)
						if #results == 1 then
							jump(results[1])
						else
							open(results)
						end
					end,
				}
			})
		end,
		lazy = true
	},

	-- Show context at the top of the file
	{
		'https://github.com/nvim-treesitter/nvim-treesitter-context',
		event = 'VeryLazy',
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
