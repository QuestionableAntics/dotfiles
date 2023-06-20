------------------------------------------------------------------------------------------
-- Important
------------------------------------------------------------------------------------------

vim.opt.emoji = true


------------------------------------------------------------------------------------------
-- Not Important
------------------------------------------------------------------------------------------

-- Set up some sensible defaults and plugins for pairing
Pairing = true
-- Are we debugging?
Debug = false

-- Needs to be set before any plugins are loaded
vim.g.mapleader = ' '

require('ensure-installed')
require('lazy').setup('plugins')
require('telescope-config')
require('language-servers')
require('config')
require('mappings')
require('autocommands')

------------------------------------------------------------------------------------------
-- Pairing
------------------------------------------------------------------------------------------

if Pairing then
	require('pairing-config')
end


------------------------------------------------------------------------------------------
-- Debugging
------------------------------------------------------------------------------------------

if Debug then
	require('debug-config')
end
