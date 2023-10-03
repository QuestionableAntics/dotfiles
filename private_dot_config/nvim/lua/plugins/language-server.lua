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
					"sqlls",
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
	},

	-- {
	-- 	'simrat39/rust-tools.nvim',
	-- 	config = function()
	-- 		require('rust-tools').setup({})
	-- 	end,
	-- },

	{
		'https://github.com/ray-x/go.nvim',
		dependencies = {
			'ray-x/guihua.lua',
		},
		config = function()
			require('go').setup()
		end,
		event = {'CmdlineEnter'},
		ft = {'go', 'gomod'},
		build = function() require('go.install').update_all_sync() end,
	},

}
