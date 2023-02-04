return {
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
}
