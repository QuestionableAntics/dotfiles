local Unused_local = {
	-- Additional Omnisharp functionality
	"Hoffs/omnisharp-extended-lsp.nvim",

	-- Markdown previewer
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
	},

	-- Edit terminal
	{
		"chomosuke/term-edit.nvim",
		config = function()
			require("term-edit").setup({ prompt_end = "%$ " })
		end,
		lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
		version = "1.*",
	},

	-- Remote environment interactions
	"miversen33/netman.nvim",

	------------------------------------------------------------
	--- Containers
	------------------------------------------------------------

	"jamestthompson3/nvim-remote-containers",

	{
		"esensar/nvim-dev-container",
		config = function()
			require("devcontainer").setup({})
		end,
	},

	{
		"arnaupv/nvim-devcontainer-cli",
		opts = {},
	},

	-- Develop inside Docker containers
	"jamestthompson3/nvim-remote-containers",

	{
		"michaelb/sniprun",
		config = function()
			require("sniprun").setup({})
		end,
		build = "bash install.sh",
	},

	-- Refactoring capabilities
	{
		"ThePrimeagen/refactoring.nvim",
		config = function()
			require("refactoring").setup({})
		end,
		depenencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
		},
	},

	-- dap integration
	"nvim-telescope/telescope-dap.nvim",

	"nvim-zh/better-escape.vim",

	{
		"chipsenkbeil/distant.nvim",
		branch = "v0.3",
		config = function()
			require("distant"):setup()
		end,
	},

	-- Code actions lightbulb
	{
		"kosayoda/nvim-lightbulb",
		event = "VeryLazy",
	},

	-- Modify quickfix buffer
	{
		"gabrielpoca/replacer.nvim",
		opts = { rename_files = false },
		keys = {
			{
				"<leader>h",
				function()
					require("replacer").run()
				end,
				desc = "run replacer.nvim",
			},
		},
		event = "VeryLazy",
	},

	{
		"https://github.com/joshuavial/aider.nvim",
		config = function()
			require("aider").setup()
		end,
		event = "VeryLazy",
	},

	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("spectre").setup()
		end,
		keys = {
			{
				"<leader>sp",
				function()
					require("spectre").toggle()
				end,
				desc = "open spectre",
			},
		},
		event = "VeryLazy",
	},

	-- Open paired files
	{
		"rgroli/other.nvim",
		config = function()
			require("other-nvim").setup({})
		end,
	},

	{
		"harrisoncramer/gitlab.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
			enabled = true,
		},
		build = function()
			require("gitlab.server").build(true)
		end, -- Builds the Go binary
		config = function()
			require("gitlab").setup() -- Uses delta reviewer by default
		end,
		event = "VeryLazy",
		enabled = false,
	},

	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup({})
		end,
		ft = { "rust" },
	},

	-- Structural find and replace
	{
		"cshuaimin/ssr.nvim",
		keys = {
			{
				"<leader>sr",
				function()
					require("ssr").open()
				end,
				desc = "Structural find and replace",
			},
		},
		lazy = true,
	},

	-- Session Management
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				auto_session_root_dir = os.getenv("HOME") .. "/.vim/sessions/",
				auto_session_suppress_dirs = { os.getenv("HOME") },
				pre_cwd_changed_hook = function()
					-- close all language servers
					vim.lsp.stop_client(vim.lsp.get_active_clients())
				end,
			})
		end,
	},

	-- Auto close and update jsx tags
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
		ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
		lazy = true,
	},
}

return {}
