return {
	-- Speed up
	'nathom/filetype.nvim',

	-- Hints for keybindings
	'folke/which-key.nvim',

	-- Undo Tree
	'mbbill/undotree',

	-- Types for vim api
	'folke/neodev.nvim',

	-- Telescope integration for docker
	'lpoto/telescope-docker.nvim',

	-- Pets
	{ 'giusgad/pets.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'edluffy/hologram.nvim',
		},
		config = function() require('pets').setup() end,
	},

	---- General dependencies
	-- popup window interface
	'nvim-lua/popup.nvim',
}
