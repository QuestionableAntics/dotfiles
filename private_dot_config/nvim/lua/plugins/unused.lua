local Unused_local = {
	-- Breakdown of what vim spends time on when starting up
	'dstein64/vim-startuptime',

	-- Additional Omnisharp functionality
	'Hoffs/omnisharp-extended-lsp.nvim',

	-- gdb for neovim
	{ 'sakhnik/nvim-gdb',
		build = ':!./install.sh',
	},

	-- operate on remote text objects
	'ggandor/leap-spooky.nvim',

	-- Develop inside Docker containers
	'jamestthompson3/nvim-remote-containers',

	-- Markdown previewer
	{ 'iamcco/markdown-preview.nvim',
		build = 'cd app && npm install',
	},

	-- Manipulate object surrounding characters
	{ 'https://github.com/kylechui/nvim-surround',
		config = function() require('nvim-surround').setup() end
	},

	-- Edit terminal
	{ 'chomosuke/term-edit.nvim',
		config = function()
			require 'term-edit'.setup { prompt_end = '%$ ' }
		end,
		lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
		version = '1.*',
	},

	-- Remote environment interactions
	'miversen33/netman.nvim',

	--  'jamestthompson3/nvim-remote-containers',
	{ 'esensar/nvim-dev-container',
		config = function() require('devcontainer').setup {} end
	},

	-- Toggle split/join
	-- Does not support C# currently
	{ 'Wansmer/treesj',
		keys = { '<space>m', '<space>j', '<space>s' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function() require('treesj').setup({}) end,
	},

	-- Pets
	{ 'giusgad/pets.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'edluffy/hologram.nvim',
		},
		config = function() require('pets').setup() end,
	},

	{ 'rmagatti/session-lens',
		config = function()
			require('session-lens').setup { path_display = { 'shorten' } }
		end
	},

	-- Per project navigation
	{ 'ThePrimeagen/harpoon',
		config = function()
			require('harpoon').setup {
				menu = {
					width = 100
				}
			}
		end
	},

	{ 'michaelb/sniprun',
		config = function() require('sniprun').setup {} end,
		build = 'bash install.sh',
	},

	-- Refactoring capabilities
	{ 'ThePrimeagen/refactoring.nvim',
		config = function()
			require('refactoring').setup {}
		end,
		depenencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-lua/plenary.nvim',
		},
	},

	-- null-ls bridge for Mason
	{ 'jay-babu/mason-null-ls.nvim',
		config = function() require('mason-null-ls').setup() end,
	},

	-- Language server for alternative completions provided through LSP
	'jose-elias-alvarez/null-ls.nvim',

	-- dap integration
	'nvim-telescope/telescope-dap.nvim',

	-- Folding
	{ 'anuvyklack/pretty-fold.nvim',
		config = function() require('pretty-fold').setup {} end,
	},

	-- Fold preview
	{ 'anuvyklack/fold-preview.nvim',
		config = function() require('fold-preview').setup() end,
		dependencies = { 'anuvyklack/keymap-amend.nvim' },
	},

}

return {}
