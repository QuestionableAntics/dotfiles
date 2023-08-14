return {
	-- Fast as FUCK autocompletion
	{ 'ms-jpq/coq_nvim', branch = 'coq' },

	-- snippets for coq.nvim
	-- { 'ms-jpq/coq.artifacts', branch = 'artifacts' },

	-- Code actions lightbulb
	'kosayoda/nvim-lightbulb',

	-- GPT chat interface
	{
		'Bryley/neoai.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
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
				prompts = {
					context = function(context)
						return [[
You are a software engineer, helping people solve problems related to all areas of development.
If you are asked to provide only code, only respond with code blocks correctly labeled in the relevant language.
The following marks the beginning of your conversation with the user.
]] .. context
					end
				}
			})
		end,
	},

	-- AI in my code
	{
		'zbirenbaum/copilot.lua',
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
