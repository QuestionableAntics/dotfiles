if not Debugging then
	return {}
end

return {
	-- Debug adapter protocol, base plugin {name = for debugging}
	{
		'mfussenegger/nvim-dap',
		keys = {
			{
				'<F9>',
				function() require('dap').continue() end,
				desc = 'Debug Continue',
				mode = 'n',
			},
			{
				'<F10>',
				function() require('dap').step_over() end,
				desc = 'Debug Step Over',
				mode = 'n',
			},
			{
				'<F11>',
				function() require('dap').step_into() end,
				desc = 'Debug Step Into',
				mode = 'n',
			},
			{
				'<F12>',
				function() require('dap').step_out() end,
				desc = 'Debug Step Out',
				mode = 'n',
			},
			{
				'<Leader>db',
				function() require('dap').toggle_breakpoint() end,
				desc = 'Debug Toggle Breakpoint',
				mode = 'n',
			},
			{
				'<Leader>dsbr',
				function()
					require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
				end,
				desc = 'Debug Set Breakpoint',
				mode = 'n',
			},
			{
				'<Leader>dsbm',
				function()
					require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
				end,
				desc = 'Debug Set Breakpoint Message',
				mode = 'n',
			},
			{
				'<Leader>dr',
				function() require('dap').repl.open() end,
				desc = 'Debug REPL',
				mode = 'n',
			},
			{
				'<Leader>dui',
				function() require('dapui').toggle() end,
				desc = 'Debug UI',
				mode = 'n',
			},
			{
				'<Leader>duh',
				function() require('dap.ui.widgets').hover() end,
				desc = 'Debug Hover',
				mode = 'n',
			},
			{
				'<Leader>duf',
				function()
					require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)
				end,
				desc = 'Debug Scopes',
				mode = 'n',
			}

		}
	},

	-- Defaults for Python debugging
	{
		'mfussenegger/nvim-dap-python',
		keys = {
			{
				'<Leader>ds',
				function()
					require('dap-python').debug_selection()
				end,
				desc = 'Debug Python Selection',
				mode = 'v',
			}
		}
	},

	-- UI for nvim dap
	'rcarriga/nvim-dap-ui',

	-- Virtual Text
	'theHamsta/nvim-dap-virtual-text',

	-- DAP <> Mason bridge
	{
		'jay-babu/mason-nvim-dap.nvim',
		config = function()
			require('mason-nvim-dap').setup({
				automatic_setup = true
			})
		end,
	},

	-- Testing
	'vim-test/vim-test', -- required for neotest
	{
		'nvim-neotest/neotest',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'haydenmeade/neotest-jest',
			'nvim-neotest/neotest-python',
			'nvim-neotest/neotest-vim-test',
		},
		keys = {
			{
				'<Leader>dn',
				function() require('neotest').run.run({ strategy = 'dap' }) end,
				desc = 'Debug Nearest Test',
			},
			{
				'<Leader>un',
				function() require('neotest').run.run() end,
				desc = 'Run Nearest Test',
			},
			{
				'<Leader>ul',
				function() require('neotest').run.run_last() end,
				desc = 'Run Last Test',
			},
			{
				'<Leader>uf',
				function() require('neotest').run.run(vim.fn.expand('%')) end,
				desc = 'Run File',
			},
			{
				'<Leader>us',
				function() require('neotest').summary.open() end,
				desc = 'Open Test Summary',
			},
			{
				'<Leader>uo',
				function() require('neotest').output.open() end,
				desc = 'Test Output',
			},
		}
	},

	-- gdb for neovim
	{
		'sakhnik/nvim-gdb',
		build = ':!./install.sh',
	},

	-- Debug Jest
	'David-Kunz/jester',
}
