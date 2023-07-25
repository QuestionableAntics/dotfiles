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

-- https://github.com/NvChad/base46/blob/master/lua/base46/integrations/telescope.lua
-- https://github.com/Mofiqul/vscode.nvim/blob/05973862f95f85dd0564338a03baf61b56e1823f/lua/vscode/theme.lua#L540
-- https://astronvim.com/Recipes/telescope_theme
-- https://github.com/NvChad/NvChad/blob/b913bdacfdcdb05a19326019d14d9b240ac689e1/lua/plugins/configs/telescope.lua

-- local colors = require('vscode.colors').get_colors()
-- local hl = vim.api.nvim_set_hl
--
-- hl(0, 'TelescopePromptBorder', { fg = colors.vscLineNumber, bg = 'NONE' })
-- hl(0, 'TelescopeResultsBorder', { fg = colors.vscLineNumber, bg = 'NONE' })
-- hl(0, 'TelescopePreviewBorder', { fg = colors.vscLineNumber, bg = 'NONE' })
-- hl(0, 'TelescopeNormal', { fg = colors.vscFront, bg = 'NONE' })
-- hl(0, 'TelescopeSelection', { fg = colors.vscFront, bg = colors.vscPopupHighlightBlue })
-- hl(0, 'TelescopeMultiSelection', { fg = colors.vscFront, bg = colors.vscPopupHighlightBlue })
-- hl(0, 'TelescopeMatching', { fg = colors.vscMediumBlue, bg = 'NONE', bold = true })
-- hl(0, 'TelescopePromptPrefix', { fg = colors.vscFront, bg = 'NONE' })
--
-- local normal = get_hlgroup "Normal"
-- local fg, bg = normal.fg, normal.bg
-- local bg_alt = get_hlgroup("Visual").bg
-- local green = get_hlgroup("String").fg
-- local red = get_hlgroup("Error").fg

-- return {
-- 	TelescopeBorder = { fg = bg_alt, bg = bg },
-- 	TelescopeNormal = { bg = bg },
-- 	TelescopePreviewBorder = { fg = bg, bg = bg },
-- 	TelescopePreviewNormal = { bg = bg },
-- 	TelescopePreviewTitle = { fg = bg, bg = green },
-- 	TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
-- 	TelescopePromptNormal = { fg = fg, bg = bg_alt },
-- 	TelescopePromptPrefix = { fg = red, bg = bg_alt },
-- 	TelescopePromptTitle = { fg = bg, bg = red },
-- 	TelescopeResultsBorder = { fg = bg, bg = bg },
-- 	TelescopeResultsNormal = { bg = bg },
-- 	TelescopeResultsTitle = { fg = bg, bg = bg },
-- }

-- hl(0, 'TelescopeBorder', { fg = bg_alt, bg = bg })
-- hl(0, 'TelescopeNormal', { bg = bg })
-- hl(0, 'TelescopePreviewBorder', { fg = bg, bg = bg })
-- hl(0, 'TelescopePreviewNormal', { bg = bg })
-- hl(0, 'TelescopePreviewTitle', { fg = bg, bg = green })
-- hl(0, 'TelescopePromptBorder', { fg = bg_alt, bg = bg_alt })
-- hl(0, 'TelescopePromptNormal', { fg = fg, bg = bg_alt })
-- hl(0, 'TelescopePromptPrefix', { fg = red, bg = bg_alt })
-- hl(0, 'TelescopePromptTitle', { fg = bg, bg = red })
-- hl(0, 'TelescopeResultsBorder', { fg = bg, bg = bg })
-- hl(0, 'TelescopeResultsNormal', { bg = bg })
-- hl(0, 'TelescopeResultsTitle', { fg = bg, bg = bg })
