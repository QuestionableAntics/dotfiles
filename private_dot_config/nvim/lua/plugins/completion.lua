return {
	-- Fast as FUCK autocompletion
	{ 'ms-jpq/coq_nvim', branch = 'coq' },

	-- coq.nvim dependency
	{ 'ms-jpq/coq.artifacts', branch = 'artifacts' },

	-- Code actions lightbulb
	'kosayoda/nvim-lightbulb',

	{ 'Bryley/neoai.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
		},
		cmd = {
			"NeoAI",
			"NeoAIOpen",
			"NeoAIClose",
			"NeoAIToggle",
			"NeoAIContext",
			"NeoAIContextOpen",
			"NeoAIContextClose",
			"NeoAIInject",
			"NeoAIInjectCode",
			"NeoAIInjectContext",
			"NeoAIInjectContextCode",
		},
		config = function()
			require("neoai").setup({
				models = {
					{
						name = "openai",
						model = "gpt-4",
						params = nil,
					},
				},
				-- Options go here
			})
		end,
	},

	-- AI in my code
	{ 'zbirenbaum/copilot.lua',
		event = { 'VimEnter' },
		config = function()
			vim.defer_fn(function()
				require('copilot').setup({
					suggestion = {
						enabled = true,
						auto_trigger = true,
						keymap = {
							accept = '<C-J>',
							accept_word = '<C-f>',
							accept_line = '<C-l>',
						},
					}
				})
			end, 100)
		end,
	},

	-- Autocomplete source for vim dadbod (database)
	'kristijanhusak/vim-dadbod-completion',
}
