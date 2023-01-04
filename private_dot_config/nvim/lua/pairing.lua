local opt = vim.opt
local wo = vim.wo
local o = vim.o


------------------------------------------------------------------------------------------
-- Plugins
------------------------------------------------------------------------------------------

-- Track mouse
require('lazy').setup {
	'edluffy/specs.nvim',
}


------------------------------------------------------------------------------------------
-- Config
------------------------------------------------------------------------------------------

wo.relativenumber = false