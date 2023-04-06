return {
	-- Fast as FUCK autocompletion
	{ 'ms-jpq/coq_nvim', branch = 'coq' },

	-- coq.nvim dependency
	{ 'ms-jpq/coq.artifacts', branch = 'artifacts' },

	-- coq.nvim snippets and other third party sources of completion
	{ 'ms-jpq/coq.thirdparty',
		config = function()
			require('coq_3p') {
				{ src = 'vim_dadbod_completion', short_name = 'DB' },
				{ src = 'dap' },
				-- { src = 'copilot', short_name = 'COP', accept_key = '<C-J>'}
			}
		end
	},

	-- Code actions lightbulb
	'kosayoda/nvim-lightbulb',

	{ 'jackMort/ChatGPT.nvim',
		config = function()
			require("chatgpt").setup({
				openai_params = {
					model = "gpt-4",
				},
				keymaps = {
					submit = "<C-j>",
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
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
