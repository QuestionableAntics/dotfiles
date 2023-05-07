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

	-- Alternative Typescript LSP
	'yioneko/nvim-vtsls',

	-- Make working with TS LS better
	'jose-elias-alvarez/typescript.nvim',
}
