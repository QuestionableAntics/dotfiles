return {
	-- Pretty Pick List
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-telescope/telescope-live-grep-args.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
			'nvim-telescope/telescope-fzy-native.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			'danielfalk/smart-open.nvim',
			'Marskey/telescope-sg',
			'debugloop/telescope-undo.nvim',
		},
		config = function()
			local lga_actions = require 'telescope-live-grep-args.actions'
			local telescope = require('telescope')

			require("telescope").setup({
				defaults = {
					-- rip grep really lives up to the rip part in certain projects otherwise
					file_ignore_patterns = {
						"node_modules",
						".git/",
						".aws-sam/",
						"build",
						"dist",
						".idea",
						".pytest_cache",
						"bin/Debug",
						"obj/",
						".yarn/*",
						".obsidian/*",
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--trim"
					},
					prompt_prefix = "  ",
					selection_caret = "  ",
					winblend = 10,
				},
				pickers = {
					find_files = {
						-- use fd to find files
						find_command = { "fd" },
						-- search hidden files in the directory
						hidden = true
					}
				},
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown {} },
					["live_grep_args"] = {
						mappings = {
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
								["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							}
						}
					},
					["ast_grep"] = {
						command = {
							"sg",
							"--json=stream",
							-- "-p",
						},     -- must have --json and -p
						grep_open_files = false, -- search in opened files
						lang = nil, -- string value, sepcify language for ast-grep `nil` for default
					},
					["undo"] = {},
				},
			})

			telescope.load_extension('ui-select')
			telescope.load_extension('fzy_native')
			telescope.load_extension('fzf')
			telescope.load_extension('live_grep_args')
			telescope.load_extension('ast_grep')
			telescope.load_extension('undo')
			telescope.load_extension('smart_open')
		end,
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
			},
			{
				"<leader>fu",
				function() require("telescope").extensions.undo.undo() end,
				desc = "open telescope-undo.nvim"
			}
		},
		event = "VeryLazy"
	},

	-- Telescope fzf integration
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = [[
		cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
		cmake --build build --config Release && cmake --install build --prefix build
		]],
		event = "VeryLazy",
	},

	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		dependencies = {
			"kkharji/sqlite.lua",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		event = "VeryLazy",
	},

	{
		'Marskey/telescope-sg',
		keys = {
			{
				'<Leader>fa',
				':Telescope ast_grep<CR>',
				desc = 'Find by AST'
			}
		},
		event = "VeryLazy",
	},
}
