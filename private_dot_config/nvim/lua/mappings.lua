local utils = require("utils")

local map = utils.base_map

map({ "v", "n" }, ";", ":")

-- Easy exit to normal mode from insert and command mode
map({ "c", "i" }, "jk", "<ESC>")
-- Get me the fuck out of the terminal
map("t", "<ESC>", [[<C-\><C-N>]])

local stems = {}
local mappings = {}

------------------------------------------------------------------------------------------
-- Miscellaneous
------------------------------------------------------------------------------------------

mappings["random"] = {
	["<esc>"] = { mode = "n", action = "<esc>:noh<CR>", label = "Remove Highlights" },

	-- change pane by direction
	["<C-j>"] = { mode = "n", action = "<C-W>j", label = "Go to pane underneath" },
	["<C-k>"] = { mode = "n", action = "<C-W>k", label = "Go to pane above" },
	["<C-h>"] = { mode = "n", action = "<C-W>h", label = "Go to pane to the left" },
	["<C-l>"] = { mode = "n", action = "<C-W>l", label = "Go to pane to the right" },

	-- resize panes
	["_"] = { mode = "n", action = ":vertical resize -15<CR>", label = "Vertical Size Decrease " },
	["+"] = { mode = "n", action = ":vertical resize +15<CR>", label = "Vertical Size Increase" },
	["="] = { mode = "n", action = ":resize +5<CR>", label = "Horizontal Size Increase" },
	["-"] = { mode = "n", action = ":resize -5<CR>", label = "Horizontal Size Decrease" },

	-- copy path to file from CWD
	["cp"] = {
		mode = "n",
		action = function()
			local path = vim.fn.expand("%")
			local cwd = vim.fn.getcwd()
			local relative_path = path:gsub(cwd, "")
			vim.fn.setreg("+", relative_path)
		end,
		label = "Copy CWD path to clipboard",
	},
	-- copy current relative file path
	["crp"] = {
		mode = "n",
		action = function()
			vim.fn.setreg("+", vim.fn.expand("%:~"))
		end,
		label = "Copy relative path to clipboard",
	},
	-- copy current file name
	["cn"] = {
		mode = "n",
		action = function()
			vim.fn.setreg("+", vim.fn.expand("%:t"))
		end,
		label = "Copy file name to clipboard",
	},
	-- copy current line number
	["cln"] = {
		mode = "n",
		action = function()
			vim.fn.setreg("+", vim.fn.line("."))
		end,
		label = "Copy line number to clipboard",
	},

	-- Format visual selection
	["gq"] = { mode = "v", action = vim.lsp.buf.format, label = "format" },

	-- Save with control s
	["<C-s>"] = { mode = "n", action = "<cmd>w<cr>", label = "Save" },

	-- Delete all buffers except current
	["<Leader>bd"] = { mode = "n", action = "<cmd>%bd|e#<cr>", label = "Delete all buffers except current" },
}

------------------------------------------------------------------------------------------
-- Neovide
------------------------------------------------------------------------------------------

mappings["neovide"] = {
	["<Leader>nv"] = {
		mode = "n",
		action = function()
			vim.cmd("silent !neovide &")
		end,
		label = "Open neovide",
	},
}

-- copy paste
if vim.g.neovide then
	vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

------------------------------------------------------------------------------------------
-- LSP Mappings
------------------------------------------------------------------------------------------

mappings["lsp"] = {
	-- Builtin
	["gD"] = { mode = "n", action = vim.lsp.buf.declaration, label = "Go to declaration" },
	-- ['gi'] = { mode = 'n', action = vim.lsp.buf.implementation, label = 'Go to implementation' },
	["gd"] = { mode = "n", action = vim.lsp.buf.definition, label = "Go to definition" },
	["gs"] = { mode = "n", action = vim.lsp.buf.signature_help, label = "Signature help" },
	["gr"] = { mode = "n", action = vim.lsp.buf.rename, label = "Rename" },
	["gt"] = { mode = "n", action = vim.lsp.buf.type_definition, label = "Go to type definition" },
	["gh"] = {
		mode = "n",
		action = function()
			require("glance").open("references")
		end,
		label = "Find references",
	},
	["ca"] = { mode = { "n", "v" }, action = vim.lsp.buf.code_action, label = "Code Action" },
	["K"] = { mode = "n", action = vim.lsp.buf.hover, label = "Hover" },
	["[e"] = { mode = "n", action = vim.diagnostic.goto_prev, label = "Previous diagnostic" },
	["]e"] = { mode = "n", action = vim.diagnostic.goto_next, label = "Next diagnostic" },
	["<Leader>gw"] = { mode = "n", action = vim.lsp.buf.document_symbol, label = "Document symbols" },
	["<Leader>gW"] = { mode = "n", action = vim.lsp.buf.workspace_symbol, label = "Workspace symbols" },
	["<Leader>="] = { mode = "n", action = vim.lsp.buf.format, label = "Formatting" },
	["<Leader>-"] = { mode = "n", action = vim.diagnostic.setloclist, label = "Diagnostic Locations" },
}

------------------------------------------------------------------------------------------
-- Motions
------------------------------------------------------------------------------------------

mappings["motion"] = {
	-- Quicker moving to front and back of lines
	["H"] = { mode = "", action = "^", label = "Move to start of line" },
	["L"] = { mode = "", action = "$", label = "Move to end of line" },

	["j"] = { mode = "", action = "gj", label = "Move down" },
	["k"] = { mode = "", action = "gk", label = "Move up" },
}

------------------------------------------------------------------------------------------
-- Tabs
------------------------------------------------------------------------------------------

mappings["tab"] = {
	["<Leader>ta"] = { mode = "n", action = ":$tabnew<CR>", label = "New tab" },
	["<Leader>tn"] = { mode = "n", action = ":tabnext<CR>", label = "Next tab" },
	["<Leader>tp"] = { mode = "n", action = ":tabprevious<CR>", label = "Previous tab" },
	["<Leader>tc"] = { mode = "n", action = ":tabclose<CR>", label = "Close tab" },
}

stems["<Leader>t"] = { label = "Tabs" }

------------------------------------------------------------------------------------------
-- Setup
------------------------------------------------------------------------------------------

local all_mappings = {}

for _, v in pairs(mappings) do
	for k2, v2 in pairs(v) do
		all_mappings[k2] = v2
	end
end

for k, v in pairs(all_mappings) do
	if type(v.mode) == "string" then
		v.mode = { v.mode }
	end

	for _, mode in ipairs(v.mode) do
		map(mode, k, v.action, v.opts, v.map_opts)
	end
end

------------------------------------------------------------------------------------------
-- Which Key
------------------------------------------------------------------------------------------

local which_key = require("which-key")

local which_key_mappings = {}

for k, v in pairs(all_mappings) do
	which_key_mappings[k] = { v.action, v.label }
end

for k, v in pairs(stems) do
	which_key_mappings[k] = v.label
end

which_key.register(which_key_mappings)

------------------------------------------------------------------------------------------

return {
	all_mappings = all_mappings,
	stems = stems,
}
