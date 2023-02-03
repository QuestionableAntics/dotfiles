require('lazy').setup({
	------------------------------------------------------------------------------------------
	-- Visuals
	------------------------------------------------------------------------------------------

	-- More pretty icons
	'kyazdani42/nvim-web-devicons',

	-- highlight matching html tags
	'gregsexton/MatchTag',

	-- VS Code theme
	{ 'Mofiqul/vscode.nvim',
		config = function()
			require('vscode').setup {
				transparent = true,
				italic_comments = true,
			}
		end,
	},

	-- Nice status bar
	{ 'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				options = { theme = require('lualine.themes.onedark') },
				sections = {
					lualine_a = {
						{ 'filename', path = 1 },
					},
				},
			}
		end,
	},

	-- Virtual text to add indentation guides
	{ 'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('indent_blankline').setup {
				show_current_context = true,
				show_current_context_start = true,
			}
		end
	},

	-- A ton of pretty UI things
	{ 'folke/noice.nvim',
		config = function()
			require('noice').setup()
			require('notify').setup { background_colour = '#000000' }
		end,
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		}
	},

	-- Pretty LSP interface
	{ 'glepnir/lspsaga.nvim',
		event = 'BufRead',
		config = function()
			require('lspsaga').setup({})
		end,
	},

	------------------------------------------------------------------------------------------
	-- Database
	------------------------------------------------------------------------------------------

	-- DB interface
	'tpope/vim-dadbod',

	-- UI for DB interface
	'kristijanhusak/vim-dadbod-ui',

	-- Postgres driver
	'jackc/pgx',


	------------------------------------------------------------------------------------------
	-- Version Control
	------------------------------------------------------------------------------------------

	-- git in vim (required for other git plugins)
	'tpope/vim-fugitive',

	-- sign column symbols for git changes and git hunk actions
	{ 'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup {
				current_line_blame = true,
				current_line_blame_opts = { delay = 200, },
			}
		end,
	},

	-- git commit browser
	'junegunn/gv.vim',

	-- Diff View
	{ 'sindrets/diffview.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
	},


	------------------------------------------------------------------------------------------
	-- Debugging and Testing
	------------------------------------------------------------------------------------------

	-- Debug adapter protocol, base plugin {name = for debugging}
	'mfussenegger/nvim-dap',

	-- Defaults for Python debugging
	'mfussenegger/nvim-dap-python',

	-- UI for nvim dap
	'rcarriga/nvim-dap-ui',

	-- Virtual Text
	'theHamsta/nvim-dap-virtual-text',

	-- Testing
	'vim-test/vim-test', -- required for neotest
	{ 'nvim-neotest/neotest',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'haydenmeade/neotest-jest',
			'nvim-neotest/neotest-python',
			'nvim-neotest/neotest-vim-test',
		},
	},

	-- Debug Jest
	'David-Kunz/jester',


	------------------------------------------------------------------------------------------
	-- Editing Functionality
	------------------------------------------------------------------------------------------

	-- Little bit of everything
	{ 'echasnovski/mini.nvim',
		config = function()
			-- underline instances of the word under the cursor
			require('mini.cursorword').setup {}
			-- auto pairing of parentheses, brackets, etc.
			require('mini.pairs').setup {}
			-- comments
			require('mini.comment').setup {}
		end
	},

	-- Syntax tree parser for better syntax highlighting among other things
	{ 'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				-- either 'all' or {'a', 'list', 'of', 'languages'}
				ensure_installed = {
					'python',
					'javascript',
					'typescript',
					'c_sharp',
					'tsx',
					'lua',
					'yaml',
					'graphql',
					'java',
					'scss',
					'css',
					'html',
					'jsdoc',
					'dockerfile',
					'toml',
					'json',
					'json5',
					'markdown',
					'http',
					'bash'
				},
				highlight = { enable = true },
				-- async installation of parsers
				sync_install = false,
				indent = { enable = true },
				-- enable nvim-ts-context-commentstring
				context_commentstring = { enable = true },
				incremental_selection = {
					enable = true,
					-- keymaps = {
					-- 	init_selection = '<c-space>',
					-- 	node_incremental = '<c-space>',
					-- 	scope_incremental = '<c-s>',
					-- 	node_decremental = '<c-backspace>',
					-- },
				},
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
						},
					},
				},
			}
		end
	},

	-- Auto close and update jsx tags
	{ 'windwp/nvim-ts-autotag',
		config = function() require('nvim-ts-autotag').setup() end
	},

	-- jsx aware commenting
	'JoosepAlviste/nvim-ts-context-commentstring',

	-- Change the surroundings
	'tpope/vim-surround',

	-- Refactoring capabilities
	{ 'ThePrimeagen/refactoring.nvim',
		config = function()
			require('refactoring').setup {}
		end,
		depenencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-lua/plenary.nvim',
		},
	},


	------------------------------------------------------------------------------------------
	-- Functionality
	------------------------------------------------------------------------------------------

	-- File explorer
	{ 'ms-jpq/chadtree',
		build = 'python3 -m chadtree deps',
		branch = 'chad',
	},

	-- Fast motions
	{ 'phaazon/hop.nvim',
		config = function()
			require('hop').setup {
				-- Themes will overwrite this sometimes, this ensures that hop greys out non highlighted letters
				create_hl_autocmd = true
			}
		end
	},

	-- Per project navigation
	{ 'ThePrimeagen/harpoon',
		config = function()
			require('harpoon').setup {
				menu = {
					width = 100
				}
			}
		end
	},

	-- Additional treesitter functionality (in/around function/class/etc. operations)
	'nvim-treesitter/nvim-treesitter-textobjects',

	-- Session Management
	{ 'rmagatti/auto-session',
		config = function()
			require('auto-session').setup {
				auto_session_root_dir = os.getenv('HOME') .. '/.vim/sessions/',
				auto_session_suppress_dirs = { '~/' },
			}
		end
	},

	-- Better Quickfix
	{ 'kevinhwang91/nvim-bqf',
		config = function() require('bqf').setup {} end
	},

	{ 'michaelb/sniprun',
		config = function() require('sniprun').setup {} end,
		build = 'bash install.sh',
	},

	--  'jamestthompson3/nvim-remote-containers',
	{ 'esensar/nvim-dev-container',
		config = function() require('devcontainer').setup {} end
	},

	-- Folding
	{ 'anuvyklack/pretty-fold.nvim',
		config = function() require('pretty-fold').setup {} end,
	},

	-- Fold preview
	{ 'anuvyklack/fold-preview.nvim',
		config = function() require('fold-preview').setup() end,
		dependencies = { 'anuvyklack/keymap-amend.nvim' },
	},

	-- Tabline
	{ 'nanozuki/tabby.nvim',
		config = function() require('tabby').setup {} end
	},


	------------------------------------------------------------------------------------------
	-- Completion
	------------------------------------------------------------------------------------------

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


	------------------------------------------------------------------------------------------
	-- Search
	------------------------------------------------------------------------------------------

	-- Pretty Pick List
	{ 'nvim-telescope/telescope.nvim',
		dependencies = {
			-- rg raw live grep
			'nvim-telescope/telescope-live-grep-args.nvim',
		},
	},

	-- Telescope fzf integration
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

	-- dap integration
	'nvim-telescope/telescope-dap.nvim',

	-- Uses telescope for the native ui-select
	'nvim-telescope/telescope-ui-select.nvim',

	{ 'rmagatti/session-lens',
		config = function()
			require('session-lens').setup { path_display = { 'shorten' } }
		end
	},

	------------------------------------------------------------------------------------------
	-- Language Server
	------------------------------------------------------------------------------------------

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

	------------------------------------------------------------------------------------------
	-- Miscellaneous
	------------------------------------------------------------------------------------------

	-- Speed up
	'nathom/filetype.nvim',

	-- Hints for keybindings
	'folke/which-key.nvim',

	-- Undo Tree
	'mbbill/undotree',

	-- Types for vim api
	'folke/neodev.nvim',

	-- Telescope integration for docker
	'lpoto/telescope-docker.nvim',

	---- General dependencies
	-- popup window interface
	'nvim-lua/popup.nvim',
})


------------------------------------------------------------------------------------------
-- Currently Unused
------------------------------------------------------------------------------------------

local Unused_local = {
	-- Breakdown of what vim spends time on when starting up
	'dstein64/vim-startuptime',

	-- Additional Omnisharp functionality
	'Hoffs/omnisharp-extended-lsp.nvim',

	-- gdb for neovim
	{ 'sakhnik/nvim-gdb',
		build = ':!./install.sh',
	},

	-- operate on remote text objects
	'ggandor/leap-spooky.nvim',

	-- Develop inside Docker containers
	'jamestthompson3/nvim-remote-containers',

	-- Markdown previewer
	{ 'iamcco/markdown-preview.nvim',
		build = 'cd app && npm install',
	},

	-- Manipulate object surrounding characters
	{ 'https://github.com/kylechui/nvim-surround',
		config = function() require('nvim-surround').setup() end
	},

	-- Edit terminal
	{ 'chomosuke/term-edit.nvim',
		config = function()
			require 'term-edit'.setup { prompt_end = '%$ ' }
		end,
		lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
		version = '1.*',
	},

	-- Better terminal (wraps text, opens terminal with command, floating buffers)
	{ 'akinsho/toggleterm.nvim',
		tag = '*',
		config = function() require('toggleterm').setup {} end
	},
}
