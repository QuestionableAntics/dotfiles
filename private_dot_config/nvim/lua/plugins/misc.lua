return {
	-- Speed up
	'nathom/filetype.nvim',

	-- Hints for keybindings
	'folke/which-key.nvim',

	-- Types for vim api
	'folke/neodev.nvim',

	---- General dependencies
	-- popup window interface
	'nvim-lua/popup.nvim',

	-- obsidian
	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	lazy = true,
	-- 	event = function()
	-- 		local parent_directory = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/'
	--
	-- 		local events = {
	-- 			"BufReadPre " .. parent_directory .. "/**.md",
	-- 			"BufNewFile " .. parent_directory .. "/**.md",
	-- 		}
	--
	-- 		return events
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	opts = {
	-- 		dir = "~/my-vault", -- no need to call 'vim.fn.expand' here
	-- 	},
	-- 	-- disabled until multi vault support
	-- 	-- https://github.com/epwalsh/obsidian.nvim/pull/155
	-- 	enabled = false
	-- }
}
