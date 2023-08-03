local telescope = require 'telescope'
local actions = require 'telescope.actions'
local lga_actions = require 'telescope-live-grep-args.actions'
local fb_actions = require 'telescope._extensions.file_browser.actions'

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
		["file_browser"] = {
			theme = "ivy",
			initial_mode = "normal",
			hidden = true,
			hijack_netrw = false,
			mappings = {
				["n"] = {
					["a"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["l"] = actions.select_default,
					["<bs>"] = false,
				}
			}
		},
		["ast_grep"] = {
			command = {
				"sg",
				"--json=stream",
				-- "-p",
			},                       -- must have --json and -p
			grep_open_files = false, -- search in opened files
			lang = nil,              -- string value, sepcify language for ast-grep `nil` for default
		},
	},
}

telescope.load_extension('ui-select')
telescope.load_extension('fzy_native')
telescope.load_extension('fzf')
telescope.load_extension('live_grep_args')
telescope.load_extension('ast_grep')
telescope.load_extension('file_browser')


------------------------------------------------------------------------------------------
-- Telescope theming
------------------------------------------------------------------------------------------

-- local colors = require('vscode.colors').get_colors()
local base_hl = vim.api.nvim_set_hl

local pale_green = "#8CCF7E"
local yellow_orange = "#E5C76B"
local magenta = "#C47FD5"
local results_title = "#0F1416"
local background = "#141B1E"
local light_gray = "#DADADA"
local cursorline = "#242e32"

local hl = function(groups)
	for group, colors in pairs(groups) do
		base_hl(0, group, colors)
	end
end

local highlights = {
	-- Prompt
	TelescopePromptTitle = {
		fg = background,
		bg = magenta,
	},
	TelescopePromptPrefix = {
		fg = pale_green,
		bg = cursorline,
	},
	TelescopePromptBorder = {
		fg = cursorline,
		bg = cursorline,
	},
	TelescopePromptNormal = {
		fg = light_gray,
		bg = cursorline,
	},

	-- Results
	TelescopeResultsTitle = {
		fg = results_title,
		bg = '#732929',
	},
	TelescopeResultsBorder = {
		fg = '#222222',
		bg = '#222222',
	},
	TelescopeResultsNormal = {
		fg = light_gray,
		bg = '#222222',
	},
	TelescopeResultsLine = {
		bg = background,
	},

	-- Preview
	TelescopePreviewTitle = {
		fg = background,
		bg = yellow_orange,
	},
	TelescopePreviewBorder = {
		fg = '#222222',
		bg = '#222222'
	},
	TelescopePreviewNormal = {
		fg = light_gray,
		bg = '#222222',
	},
}

hl(highlights)
