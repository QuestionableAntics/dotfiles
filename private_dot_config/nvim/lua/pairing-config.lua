------------------------------------------------------------------------------------------
-- Configuration setup for pairing
------------------------------------------------------------------------------------------

local wo = vim.wo
local opt = vim.opt


-- Unless accustomed to relative line numbers, they can be distracting and confusing
wo.relativenumber = false

-- Enable using the mouse to move positions in and in between buffers
opt.mouse = "a"
