return {
	-- Little bit of everything
	{
		'echasnovski/mini.nvim',
		config = function()
			-- underline instances of the word under the cursor
			require('mini.cursorword').setup {}
			-- auto pairing of parentheses, brackets, etc.
			require('mini.pairs').setup {}
			-- additional targets to jump to next/prev
			require('mini.bracketed').setup {}
			-- commenting
			require('mini.comment').setup {
				options = {
					custom_commentstring = function()
						return require('ts_context_commentstring.internal').calculate_commentstring() or
							vim.bo.commentstring
					end,
				}
			}
		end,
		event = 'VeryLazy',
	},

	-- Syntax tree parser for better syntax highlighting among other things
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				-- either 'all' or {'a', 'list', 'of', 'languages'}
				modules = {},
				auto_install = true,
				ignore_install = {},
				ensure_installed = {
					'python',
					'javascript',
					'typescript',
					'c_sharp',
					'tsx',
					'lua',
					'yaml',
					'graphql',
					'java',
					'scss',
					'css',
					'html',
					'jsdoc',
					'dockerfile',
					'toml',
					'json',
					'json5',
					'markdown',
					'http',
					'bash',
					'rust',
					'go',
				},
				highlight = { enable = true },
				-- async installation of parsers
				sync_install = false,
				indent = { enable = true },
				-- enable nvim-ts-context-commentstring
				context_commentstring = { enable = true },
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
							['ab'] = '@block.outer',
							['ib'] = '@block.inner',
							['al'] = '@loop.outer',
							['il'] = '@loop.inner',
							['ai'] = '@conditional.outer',
							['ii'] = '@conditional.inner',
							['as'] = '@statement.outer',
							['is'] = '@statement.inner',
							['ad'] = '@comment.outer',
							['am'] = '@call.outer',
							['im'] = '@call.inner',
						},
					},
				},
			}
		end,
		event = 'VeryLazy',
	},

	-- jsx aware commenting
	{
		'JoosepAlviste/nvim-ts-context-commentstring',
		lazy = true,
	},

	-- Manipulate object surrounding characters
	{
		'https://github.com/kylechui/nvim-surround',
		event = 'VeryLazy',
		config = function() require('nvim-surround').setup() end,
	},

	-- Formatter plugin
	{
		'stevearc/conform.nvim',
		opts = {},
		keys = {
			{
				'<leader>fq',
				function()
					require('conform').format({ bufnr = 0, lsp_fallback = true })
				end,
				desc = 'Format buffer',
			}
		},
		event = 'VeryLazy',
	},
}
