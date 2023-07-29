local telescope = require 'telescope'
local lga_actions = require 'telescope-live-grep-args.actions'
local get_hlgroup = require 'utils'.get_hlgroup

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

telescope.load_extension('fzf')
telescope.load_extension('live_grep_args')
telescope.load_extension('ui-select')


------------------------------------------------------------------------------------------
-- Telescope theming
------------------------------------------------------------------------------------------

-- local colors = require('vscode.colors').get_colors()
local base_hl = vim.api.nvim_set_hl

local color2 = "#8CCF7E"
local preview_title = "#E5C76B"
local prompt_title = "#C47FD5"
local results_title = "#0F1416"
local background = "#141B1E"
local foreground = "#DADADA"
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
		bg = prompt_title,
	},
	TelescopePromptPrefix = {
		fg = color2,
		bg = cursorline,
	},
	TelescopePromptBorder = {
		fg = cursorline,
		bg = cursorline,
	},
	TelescopePromptNormal = {
		fg = foreground,
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
		fg = foreground,
		bg = '#222222',
	},
	TelescopeResultsLine = {
		bg = background,
	},

	-- Preview
	TelescopePreviewTitle = {
		fg = background,
		bg = preview_title,
	},
	TelescopePreviewBorder = {
		fg = '#222222',
		bg = '#222222'
	},
	TelescopePreviewNormal = {
		fg = foreground,
		bg = '#222222',
	},
}

hl(highlights)
