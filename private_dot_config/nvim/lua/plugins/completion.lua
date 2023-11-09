return {
	-- Fast as FUCK autocompletion
	{
		'ms-jpq/coq_nvim',
		branch = 'coq',
		init = function()
			-- Source is automatically added, you just need to include it in the chain complete list
			vim.g.completion_chain_complete_list = {
				sql = {
					complete_items = { 'vim-dadbod-completion' }
				}
			}

			-- Auto start coq (must be run before require 'coq')
			vim.g.coq_settings = {
				-- always start coq (silently)
				auto_start = 'shut-up',
				-- this takes over <C-h>?
				keymap = { jump_to_mark = '' },
				-- a lot of what I want from autocomplete is exploring properties on objects
				-- this makes those properties more visible in large projects by prioritizing lsp results
				clients = {
					lsp = { weight_adjust = 1.6 },
					snippets = { warn = {} },
				},
			}
		end,
		event = 'VeryLazy',
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
						model = "gpt-4-1106-preview",
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
		keys = function()
			require('which-key').register({ ['<Leader>a'] = 'AI' })

			return {
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
			}
		end,
		lazy = true,
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
		ft = { 'sql', 'mysql', 'plsql', 'pgsql', 'sqlite', },
	},
}
