local Unused_local = {
	-- Breakdown of what vim spends time on when starting up
	'dstein64/vim-startuptime',

	-- Additional Omnisharp functionality
	'Hoffs/omnisharp-extended-lsp.nvim',

	-- gdb for neovim
	{
		'sakhnik/nvim-gdb',
		build = ':!./install.sh',
	},

	-- Develop inside Docker containers
	'jamestthompson3/nvim-remote-containers',

	-- Markdown previewer
	{
		'iamcco/markdown-preview.nvim',
		build = 'cd app && npm install',
	},

	-- Manipulate object surrounding characters
	{
		'https://github.com/kylechui/nvim-surround',
		config = function() require('nvim-surround').setup() end
	},

	-- Edit terminal
	{
		'chomosuke/term-edit.nvim',
		config = function()
			require 'term-edit'.setup { prompt_end = '%$ ' }
		end,
		lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
		version = '1.*',
	},

	-- Remote environment interactions
	'miversen33/netman.nvim',

	--  'jamestthompson3/nvim-remote-containers',
	{
		'esensar/nvim-dev-container',
		config = function() require('devcontainer').setup {} end
	},

	{
		'michaelb/sniprun',
		config = function() require('sniprun').setup {} end,
		build = 'bash install.sh',
	},

	-- Refactoring capabilities
	{
		'ThePrimeagen/refactoring.nvim',
		config = function()
			require('refactoring').setup {}
		end,
		depenencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-lua/plenary.nvim',
		},
	},

	-- dap integration
	'nvim-telescope/telescope-dap.nvim',

	-- Folding
	{
		'anuvyklack/pretty-fold.nvim',
		config = function() require('pretty-fold').setup {} end,
	},

	-- Fold preview
	{
		'anuvyklack/fold-preview.nvim',
		config = function() require('fold-preview').setup() end,
		dependencies = { 'anuvyklack/keymap-amend.nvim' },
	},
}

return {}
