return {
	-- A collection of common configurations for Neovim's built-in language server client
	-- Handles automatically launching and initializing installed language servers
	'neovim/nvim-lspconfig',

	-- beta roslyn lsp support, ideally can be removed eventually if this gets moved into mason
	{
		'https://github.com/jmederosalvarado/roslyn.nvim',
		ft = { 'cs' },
		enabled = false,
	},

	{
		'https://github.com/lhKipp/nvim-nu',
		config = function()
			require('nu').setup{
				use_lsp_features = false
			}
		end,
		build = ':TSInstall nu',
		ft = { 'nu' },
	},

	-- General external editor tooling installation management (Language servers, dap servers, linters, formatters)
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
			require('mason-lspconfig').setup {
				ensure_installed = {
					"omnisharp",
					"pyright",
					"terraformls",
					"ansiblels",
					"bashls",
					"cssls",
					"cssmodules_ls",
					"denols",
					"eslint",
					"gopls",
					"graphql",
					"html",
					"jsonls",
					"lua_ls",
					"sqlls",
				}
			}

			require('language-servers').setup()
		end,
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
		},
	},

	-- direct integration with tsserver
	{
		"pmizio/typescript-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
		ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
	},

	{
		'https://github.com/ray-x/go.nvim',
		dependencies = {
			'ray-x/guihua.lua',
		},
		config = function() require('go').setup() end,
		ft = {'go', 'gomod'},
		build = function() require('go.install').update_all_sync() end,
	},
}
