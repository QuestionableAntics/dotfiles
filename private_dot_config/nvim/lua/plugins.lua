-- https://github.com/wbthomason/packer.nvim

local use = require('utils').use

-- Speeds up loading of lua modules for better start up time.
-- Periodically check if this is needed (it will be merged into neovim main at some point)
use {
	'lewis6991/impatient.nvim',
	config = function() require('impatient') end
}

-- package manager
use 'wbthomason/packer.nvim'


------------------------------------------------------------------------------------------
-- Visuals
------------------------------------------------------------------------------------------

-- More pretty icons
use 'kyazdani42/nvim-web-devicons'

-- highlight matching html tags
use 'gregsexton/MatchTag'

-- VS Code theme
use {
	'Mofiqul/vscode.nvim',
	config = function()
		require('vscode').setup {
			transparent = true,
			italic_comments = true,
		}
	end
}

-- Nice status bar
use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	config = function()
		require('lualine').setup {
			options = { theme = 'vscode' },
			sections = {
				lualine_a = {
					{ 'filename', path = 1 },
				},
			},
		}
	end
}

-- Virtual text to add indentation guides
use {
	'lukas-reineke/indent-blankline.nvim',
	config = function()
		require('indent_blankline').setup {
			show_current_context = true,
			show_current_context_start = true,
		}
	end
}

-- use {
-- 	"folke/noice.nvim",
-- 	config = function()
-- 		require("noice").setup()
-- 		require("notify").setup { background_colour = "#000000" }
-- 	end,
-- 	requires = {
-- 		"MunifTanjim/nui.nvim",
-- 		"rcarriga/nvim-notify",
-- 	}
-- }


------------------------------------------------------------------------------------------
-- Database
------------------------------------------------------------------------------------------

-- DB interface
use 'tpope/vim-dadbod'

-- UI for DB interface
use 'kristijanhusak/vim-dadbod-ui'

-- Postgres driver
use 'jackc/pgx'


------------------------------------------------------------------------------------------
-- Version Control
------------------------------------------------------------------------------------------

-- git in vim (required for other git plugins)
use 'tpope/vim-fugitive'

-- sign column symbols for git changes and git hunk actions
use {
	'lewis6991/gitsigns.nvim',
	config = function()
		require('gitsigns').setup {
			current_line_blame = true,
			current_line_blame_opts = { delay = 200, },
		}
	end
}

-- git commit browser
use 'junegunn/gv.vim'

-- Diff View
use {
	'sindrets/diffview.nvim',
	requires = 'nvim-lua/plenary.nvim'
}


------------------------------------------------------------------------------------------
-- Debugging and Testing
------------------------------------------------------------------------------------------

-- Debug adapter protocol, base plugin {name = for debugging}
use 'mfussenegger/nvim-dap'

-- Defaults for Python debugging
use 'mfussenegger/nvim-dap-python'

-- UI for nvim dap
use 'rcarriga/nvim-dap-ui'

-- Virtual Text
use 'theHamsta/nvim-dap-virtual-text'

-- Testing
use 'vim-test/vim-test' -- required for neotest
use {
	'nvim-neotest/neotest',
	requires = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'haydenmeade/neotest-jest',
		'nvim-neotest/neotest-python',
		'nvim-neotest/neotest-vim-test'
	},
}

-- Debug Jest
use 'David-Kunz/jester'


------------------------------------------------------------------------------------------
-- Editing Functionality
------------------------------------------------------------------------------------------

-- Little bit of everything
use {
	'echasnovski/mini.nvim',
	config = function()
		-- underline instances of the word under the cursor
		require('mini.cursorword').setup {}
		-- auto pairing of ({["'`< etc
		require('mini.pairs').setup {}
		-- comments
		require('mini.comment').setup {}
	end
}

-- Syntax tree parser for better syntax highlighting among other things
use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup {
			-- either "all" or {"a", "list", "of", "languages"}
			ensure_installed = {
				"python",
				"javascript",
				"typescript",
				"c_sharp",
				"tsx",
				"lua",
				"yaml",
				"graphql",
				"java",
				"scss",
				"css",
				"html",
				"jsdoc",
				"dockerfile",
				"toml",
				"json",
				"json5",
				"markdown",
				"http",
				"bash"
			},
			highlight = { enable = true },
			-- async installation of parsers
			sync_install = false,
			indent = { enable = true },
			-- enable nvim-ts-context-commentstring
			context_commentstring = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
				init_selection = '<c-space>',
					node_incremental = '<c-space>',
					scope_incremental = '<c-s>',
					node_decremental = '<c-backspace>',
				},
			},
			textobjects = {
				select = {
					enable = true,
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
		}
	end
}

-- Auto close and update jsx tags
use {
	'windwp/nvim-ts-autotag',
	config = function() require('nvim-ts-autotag').setup() end
}

-- jsx aware commenting
use 'JoosepAlviste/nvim-ts-context-commentstring'

-- Change the surroundings
use 'tpope/vim-surround'


------------------------------------------------------------------------------------------
-- Functionality
------------------------------------------------------------------------------------------

-- File explorer
use {
	'ms-jpq/chadtree',
	run = 'python3 -m chadtree deps',
	branch = 'chad'
}

-- Fast motions
use {
	'phaazon/hop.nvim',
	config = function()
		require('hop').setup {
			-- Themes will overwrite this sometimes, this ensures that hop greys out non highlighted letters
			create_hl_autocmd = true
		}
	end
}

-- Additional treesitter functionality (in/around function/class/etc. operations)
use 'nvim-treesitter/nvim-treesitter-textobjects'

-- Session Management
use {
	'rmagatti/auto-session',
	config = function()
		require('auto-session').setup {
			auto_session_root_dir = os.getenv('HOME') .. '/.vim/sessions/',
			auto_session_suppress_dirs = { '~/' },
		}
	end
}

-- Better Quickfix
use {
	'kevinhwang91/nvim-bqf',
	config = function() require('bqf').setup() end
}

use {
	'michaelb/sniprun',
	config = function()
		require('sniprun').setup {}
	end,
	run = 'bash install.sh',
}

-- use  'jamestthompson3/nvim-remote-containers'
use {
	'https://codeberg.org/esensar/nvim-dev-container',
	config = function() require("devcontainer").setup {} end
}

------------------------------------------------------------------------------------------
-- Completion
------------------------------------------------------------------------------------------

-- Fast as FUCK autocompletion
use { 'ms-jpq/coq_nvim', branch = 'coq' }

-- coq.nvim dependency
use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

-- coq.nvim snippets and other third party sources of completion
use {
	'ms-jpq/coq.thirdparty',
	config = function()
		require('coq_3p') {
			{ src = 'vim_dadbod_completion', short_name = 'DB' },
			{ src = 'dap' },
			-- { src = 'copilot', short_name = 'COP', accept_key = '<C-J>'}
		}
	end
}

-- AI in my code
use 'github/copilot.vim'

-- Autocomplete source for vim dadbod (database)
use 'kristijanhusak/vim-dadbod-completion'


------------------------------------------------------------------------------------------
-- Search
------------------------------------------------------------------------------------------

-- Pretty Pick List
use {
	'nvim-telescope/telescope.nvim',
	requires = {
		-- rg raw live grep
		'nvim-telescope/telescope-live-grep-args.nvim'
	},
}

-- Telescope fzf integration
use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

-- dap integration
use 'nvim-telescope/telescope-dap.nvim'

-- Uses telescope for the native ui-select
use 'nvim-telescope/telescope-ui-select.nvim'

use {
	'rmagatti/session-lens',
	config = function()
		require('session-lens').setup {
			path_display = { "shorten" },
		}
	end
}

------------------------------------------------------------------------------------------
-- Language Server
------------------------------------------------------------------------------------------

-- A collection of common configurations for Neovim's built-in language server client
-- Handles automatically launching and initializing installed language servers
use 'neovim/nvim-lspconfig'

-- General external editor tooling installation management (Language servers, dap servers, linters, formatters)
use {
	'williamboman/mason.nvim',
	config = function()
		require('mason').setup()
		require('mason-lspconfig').setup()
	end,
	requires = { 'williamboman/mason-lspconfig.nvim' }
}

-- language server for alternative completions provided through LSP
use 'jose-elias-alvarez/null-ls.nvim'

-- Make working with TS LS better
use {
	'jose-elias-alvarez/typescript.nvim',
	config = function()
		require('typescript').setup {}
	end
}

---- General dependencies
-- popup window interface
use 'nvim-lua/popup.nvim'


------------------------------------------------------------------------------------------
-- Miscellaneous
------------------------------------------------------------------------------------------

-- More speed up
use 'nathom/filetype.nvim'

-- Hints for keybindings
use 'folke/which-key.nvim'

-- Undo Tree
use 'mbbill/undotree'


------------------------------------------------------------------------------------------
-- Currently Unused
------------------------------------------------------------------------------------------


local CurrentlyUnused = function()
	-- types for vim api
	use 'folke/neodev.nvim'

	-- Breakdown of what vim spends time on when starting up
	use 'dstein64/vim-startuptime'

	-- Additional Omnisharp functionality
	use 'Hoffs/omnisharp-extended-lsp.nvim'

	-- Per project navigation
	use 'ThePrimeagen/harpoon'

	-- gdb for neovim
	use {
		'sakhnik/nvim-gdb',
		run = ':!./install.sh'
	}

	-- Lua AI in my code
	use {
		'zbirenbaum/copilot.lua',
		-- event = {"VimEnter"},
		config = function()
			vim.defer_fn(function()
				require('copilot').setup({
					suggestion = { keymap = { accept = "<C-J>" } }
					-- plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
				})
			end, 100)
		end,
	}

	-- operate on remote text objects
	use 'ggandor/leap-spooky.nvim'

	-- Folding
	use {
		'anuvyklack/pretty-fold.nvim',
		config = function()
			require('pretty-fold').setup {}
			require('fold-preview').setup {}
		end,
		requires = {
			'anuvyklack/nvim-keymap-amend',
			'anuvyklack/fold-preview.nvim'
		}
	}

	-- Develop inside Docker containers
	use 'jamestthompson3/nvim-remote-containers'

	-- Markdown previewer
	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
	}

	-- Better terminal (wraps text, opens terminal with command, floating buffers)
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
		config = function()
			require("toggleterm").setup {}
		end
	}

end

local DeprecationStation = function()

	-- Tabline
	use {
		'nanozuki/tabby.nvim',
		config = function() require('tabby').setup {} end
	}

	-- Manipulate object surrounding characters
	use {
		'https://github.com/kylechui/nvim-surround',
		config = function()
			require("nvim-surround").setup()
		end
	}
end
