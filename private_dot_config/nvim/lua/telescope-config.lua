local telescope = require 'telescope'
local lga_actions = require 'telescope-live-grep-args.actions'

telescope.setup {
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
			".yarn/*"
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
	},
}

if Debug then
	telescope.load_extension('dap')
end
telescope.load_extension('fzf')
telescope.load_extension('live_grep_args')
telescope.load_extension('ui-select')
telescope.load_extension('docker')
