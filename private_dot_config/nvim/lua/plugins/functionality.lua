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

	-- Tabline
	{ 'nanozuki/tabby.nvim',
		config = function() require('tabby').setup {} end
	},

	-- Better terminal (opens terminal with command, floating buffers)
	{ 'akinsho/toggleterm.nvim',
		version = '*',
		config = true
	},
}
