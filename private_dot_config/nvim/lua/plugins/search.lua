-- ['<Leader>ff'] = { mode = 'n', action = telescope_builtin.find_files, label = 'Find files' },
-- ['<Leader>fg'] = { mode = 'n', action = telescope.extensions.live_grep_args.live_grep_args, label = 'Live Grep' },
-- ['<Leader>fa'] = { mode = 'n', action = ':Telescope ast_grep<CR>', label = 'Find by AST' },
-- ['<Leader>fb'] = { mode = 'n', action = telescope_builtin.buffers, label = 'Find Buffers' },
-- ['<Leader>fh'] = { mode = 'n', action = telescope_builtin.help_tags, label = 'Find Help Tags' },
-- ['<Leader>fo'] = { mode = 'n', action = telescope_builtin.oldfiles, label = 'Find Old Files' },
-- ['<Leader>fl'] = { mode = 'n', action = telescope_builtin.resume, label = 'Last Search Results' },
-- ['<Leader>fs'] = {
-- 	mode = 'n',
-- 	action = function()
-- 		telescope.extensions.smart_open.smart_open {
-- 			cwd_only = true,
-- 		}
-- 	end,
-- 	label = 'Smart Open'
-- },
-- ['<Leader>fxd'] = {
-- 	mode = 'n',
-- 	action = function() telescope_builtin.diagnostics { bufnr = 0 } end,
-- 	label = 'Find Diagnostics in Focused Buffer'
-- },
-- ['<Leader>fxw'] = { mode = 'n', action = telescope_builtin.diagnostics, label = 'Find Diagnostics in Open Buffers' },
-- ['<Leader>/'] = {
-- 	mode = 'n',
-- 	action = function()
-- 		require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
-- 			winblend = 10,
-- 			previewer = false,
-- 		})
-- 	end,
-- 	label = 'Fuzzily search in current buffer'
-- }

return {
	-- Pretty Pick List
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			-- rg raw live grep
			'nvim-telescope/telescope-live-grep-args.nvim',
		},
		keys = {
			{
				'<Leader>ff',
				function() require('telescope.builtin').find_files() end,
				desc = 'Find files'
			},
			{
				'<Leader>fg',
				function() require('telescope').extensions.live_grep_args.live_grep_args() end,
				desc = 'Live Grep'
			},
			{
				'<Leader>fa',
				function() vim.api.nvim_exec(':Telescope ast_grep<CR>', false) end,
				desc = 'Find by AST'
			},
			{
				'<Leader>fb',
				function() require('telescope.builtin').buffers() end,
				desc = 'Find Buffers'
			},
			{
				'<Leader>fh',
				function() require('telescope.builtin').help_tags() end,
				desc = 'Find Help Tags'
			},
			{
				'<Leader>fo',
				function() require('telescope.builtin').oldfiles() end,
				desc = 'Find Old Files'
			},
			{
				'<Leader>fl',
				function() require('telescope.builtin').resume() end,
				desc = 'Last Search Results'
			},
			{
				'<Leader>fs',
				function() require('telescope').extensions.smart_open.smart_open { cwd_only = true } end,
				desc = 'Smart Open'
			},
			{
				'<Leader>fxd',
				function() require('telescope.builtin').diagnostics { bufnr = 0 } end,
				desc = 'Find Diagnostics in Focused Buffer'
			},
			{
				'<Leader>fxw',
				function() require('telescope.builtin').diagnostics() end,
				desc = 'Find Diagnostics in Open Buffers'
			},
			{
				'<Leader>/',
				function()
					require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
						winblend = 10,
						previewer = false,
					})
				end,
				desc = 'Fuzzily search in current buffer'
			}
		}
	},

	-- Telescope fzf integration
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = [[
		cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
		cmake --build build --config Release && cmake --install build --prefix build
		]],
	},

	-- Uses telescope for the native ui-select
	'nvim-telescope/telescope-ui-select.nvim',

	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		config = function()
			require("telescope").load_extension("smart_open")
			-- require("telescope").extensions.smart_open.smart_open {
			-- 	cwd_only = true,
			-- }
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	'Marskey/telescope-sg',

	'nvim-telescope/telescope-fzy-native.nvim',

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					undo = {
						-- telescope-undo.nvim config, see below
					},
				},
			})
			require("telescope").load_extension("undo")
			-- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
		end,
		keys = {
			{
				"<leader>fu",
				function()
					require("telescope").extensions.undo.undo()
				end,
				desc = "open telescope-undo.nvim"
			}
		}
	}, }
