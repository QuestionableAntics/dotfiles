return {
	-- Little bit of everything
	{
		'echasnovski/mini.nvim',
		config = function()
			-- underline instances of the word under the cursor
			require('mini.cursorword').setup {}
			-- auto pairing of parentheses, brackets, etc.
			require('mini.pairs').setup {}
			-- comments
			-- require('mini.comment').setup {}
			-- additional targets to jump to next/prev
			require('mini.bracketed').setup {}
			require('mini.files').setup {
				mappings = {
					synchronize = '<cr>',
				},
				windows = {
					max_number = 3,
					preview = true,
					width_preview = 200
				}
			}
		end
	},

	-- Commenting
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
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
						},
					},
				},
			}
		end
	},

	-- Auto close and update jsx tags
	{
		'windwp/nvim-ts-autotag',
		config = function() require('nvim-ts-autotag').setup() end
	},

	-- jsx aware commenting
	'JoosepAlviste/nvim-ts-context-commentstring',

	-- Manipulate object surrounding characters
	{
		'https://github.com/kylechui/nvim-surround',
		event = 'VeryLazy',
		config = function() require('nvim-surround').setup() end
	},

	-- Structural find and replace
	'cshuaimin/ssr.nvim',

	-- Modify quickfix buffer
	{
		'gabrielpoca/replacer.nvim',
		opts = { rename_files = false },
		keys = {
			{
				'<leader>h',
				function() require('replacer').run() end,
				desc = "run replacer.nvim"
			}
		}
	}
}
