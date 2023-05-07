return {
	-- Little bit of everything
	{ 'echasnovski/mini.nvim',
		config = function()
			-- underline instances of the word under the cursor
			require('mini.cursorword').setup {}
			-- auto pairing of parentheses, brackets, etc.
			require('mini.pairs').setup {}
			-- comments
			require('mini.comment').setup {}
			-- additional targets to jump to next/prev
			require('mini.bracketed').setup {}
		end
	},

	-- Syntax tree parser for better syntax highlighting among other things
	{ 'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				-- either 'all' or {'a', 'list', 'of', 'languages'}
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
					'bash'
				},
				highlight = { enable = true },
				-- async installation of parsers
				sync_install = false,
				indent = { enable = true },
				-- enable nvim-ts-context-commentstring
				context_commentstring = { enable = true },
				incremental_selection = {
					enable = true,
					-- keymaps = {
					-- 	init_selection = '<c-space>',
					-- 	node_incremental = '<c-space>',
					-- 	scope_incremental = '<c-s>',
					-- 	node_decremental = '<c-backspace>',
					-- },
				},
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
						},
					},
				},
			}
		end
	},

	-- Auto close and update jsx tags
	{ 'windwp/nvim-ts-autotag',
		config = function() require('nvim-ts-autotag').setup() end
	},

	-- jsx aware commenting
	'JoosepAlviste/nvim-ts-context-commentstring',

	-- Change the surroundings
	'tpope/vim-surround',
}