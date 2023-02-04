return {
	-- Debug adapter protocol, base plugin {name = for debugging}
	'mfussenegger/nvim-dap',

	-- Defaults for Python debugging
	'mfussenegger/nvim-dap-python',

	-- UI for nvim dap
	'rcarriga/nvim-dap-ui',

	-- Virtual Text
	'theHamsta/nvim-dap-virtual-text',

	-- Testing
	'vim-test/vim-test', -- required for neotest
	{ 'nvim-neotest/neotest',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'haydenmeade/neotest-jest',
			'nvim-neotest/neotest-python',
			'nvim-neotest/neotest-vim-test',
		},
	},

	-- Debug Jest
	'David-Kunz/jester',
}
