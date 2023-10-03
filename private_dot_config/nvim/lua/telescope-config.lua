------------------------------------------------------------------------------------------
-- Telescope theming
------------------------------------------------------------------------------------------

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
