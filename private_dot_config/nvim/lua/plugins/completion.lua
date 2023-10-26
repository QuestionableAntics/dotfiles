return {
	-- Fast as FUCK autocompletion
	{
		'ms-jpq/coq_nvim',
		branch = 'coq',
		event = 'VeryLazy',
	},

	-- Code actions lightbulb
	{
		'kosayoda/nvim-lightbulb',
		event = "VeryLazy",
	},

	{
		'https://github.com/joshuavial/aider.nvim',
		config = function() require("aider").setup() end,
		event = "VeryLazy",
	},

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
		keys = {
			{
				'<Leader>ait',
				 ':NeoAIToggle<CR>',
				desc = 'Toggle Neo AI'
			},
			{
				'na',
				':NeoAIContext<CR>',
				mode = 'v'
			}
		},
		event = "VeryLazy",
	},

	-- AI in my code
	{
		'zbirenbaum/copilot.lua',
		event = { 'VeryLazy' },
		config = function()
			vim.defer_fn(function()
				require('copilot').setup({
					copilot_node_command = os.getenv("HOME") .. '/.local/share/rtx/installs/node/18.16.1/bin/node',
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
	{
		'kristijanhusak/vim-dadbod-completion',
		event = { 'VeryLazy' },
	},
}
