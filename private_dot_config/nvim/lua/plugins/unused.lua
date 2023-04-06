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

	-- Toggle split/join
	-- Does not support C# currently
	{ 'Wansmer/treesj',
		keys = { '<space>m', '<space>j', '<space>s' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function() require('treesj').setup({}) end,
	}
}

return {}
