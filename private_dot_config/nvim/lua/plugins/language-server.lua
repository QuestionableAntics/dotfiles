return {
	-- A collection of common configurations for Neovim's built-in language server client
	-- Handles automatically launching and initializing installed language servers
	'neovim/nvim-lspconfig',

	-- General external editor tooling installation management (Language servers, dap servers, linters, formatters)
	{ 'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
			require('mason-lspconfig').setup()
		end,
		dependencies = { 'williamboman/mason-lspconfig.nvim' }
	},

	-- Language server for alternative completions provided through LSP
	'jose-elias-alvarez/null-ls.nvim',

	-- Make working with TS LS better
	'jose-elias-alvarez/typescript.nvim',

	-- null-ls bridge for Mason
	{ 'jay-babu/mason-null-ls.nvim',
		config = function() require('mason-null-ls').setup() end,
	},
}
