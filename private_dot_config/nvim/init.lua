------------------------------------------------------------------------------------------
-- Important
------------------------------------------------------------------------------------------

vim.opt.emoji = true


------------------------------------------------------------------------------------------
-- Not Important
------------------------------------------------------------------------------------------

-- Set up some sensible defaults and plugins for pairing
Pairing = false

-- Debugging functionality
Debugging = false

-- Needs to be set before any plugins are loaded
vim.g.mapleader = ' '

vim.loader.enable()

require('ensure-installed')
require('lazy').setup('plugins', {
	dev = {
		path = '~/.config/nvim/lua/custom-plugins/',
	}
})
require('telescope-config')
-- require('language-servers')
require('config')
require('mappings')
require('autocommands')


------------------------------------------------------------------------------------------
-- Debugging
------------------------------------------------------------------------------------------

if Debugging then
	require('debug-config')
end


------------------------------------------------------------------------------------------
-- Pairing
------------------------------------------------------------------------------------------

if Pairing then
	require('pairing-config')
end
