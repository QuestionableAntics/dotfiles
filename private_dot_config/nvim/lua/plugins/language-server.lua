return {
	-- A collection of common configurations for Neovim's built-in language server client
	-- Handles automatically launching and initializing installed language servers
	'neovim/nvim-lspconfig',

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
					"sqls",
				}
			}
		end,
		dependencies = { 'williamboman/mason-lspconfig.nvim' }
	},

	-- direct integration with tsserver
	{
		"pmizio/typescript-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
	}
}
