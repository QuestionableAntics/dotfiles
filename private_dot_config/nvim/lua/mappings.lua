local utils = require 'utils'

local map = utils.base_map
local imap = utils.imap
local tmap = utils.tmap

vim.g.mapleader = ' '
map({ 'v', 'n' }, ';', ':')

-- Easy exit to normal mode from insert and command mode
map({ 'c', 'i' }, 'jk', '<ESC>')
-- Get me the fuck out of the terminal
tmap('jk', [[<C-\><C-N>]])

local stems = {}
local mappings = {}


------------------------------------------------------------------------------------------
-- Miscellaneous
------------------------------------------------------------------------------------------

local sniprun = require('sniprun')

imap('<C-J>', 'copilot#Accept("\\<CR>")', { override = true }, { expr = true, silent = true, script = true })

mappings['random'] = {
	['<esc>'] = { mode = 'n', action = '<esc>:noh<CR>', label = 'Remove Highlights' },
	-- ['<esc>'] = { mode = 'n', action = '<esc>:noh<CR>', opts = { desc = 'Remove Highlights' } },
	['<Leader>v'] = { mode = 'n', action = '<cmd>CHADopen<cr>', label = 'Open file explorer' },

	-- change pane by direction
	['<C-j>'] = { mode = 'n', action = '<C-W>j', label = 'Go to pane underneath' },
	['<C-k>'] = { mode = 'n', action = '<C-W>k', label = 'Go to pane above' },
	['<C-h>'] = { mode = 'n', action = '<C-W>h', label = 'Go to pane to the left' },
	['<C-l>'] = { mode = 'n', action = '<C-W>l', label = 'Go to pane to the right' },

	-- resize panes
	['_'] = { mode = 'n', action = ':vertical resize -15<CR>', label = 'Vertical Size Decrease ' },
	['+'] = { mode = 'n', action = ':vertical resize +15<CR>', label = 'Vertical Size Increase' },
	['='] = { mode = 'n', action = ':resize +5<CR>', label = 'Horizontal Size Increase' },
	['-'] = { mode = 'n', action = ':resize -5<CR>', label = 'Horizontal Size Decrease' },

	-- snip run
	['m'] = { mode = 'v', action = function() sniprun.run('v') end, label = 'Sniprun Visual' },

	-- copy path to file from CWD
	['cp'] = { mode = 'n', action = ':let @* = expand("%")<CR>', label = 'Copy file path from CWD' },
	-- copy current relative file path
	['crp'] = { mode = 'n', action = ':let @* = expand("%:~")<CR>', label = 'Copy current file path from home directory' },
	-- copy current file name
	['cn'] = { mode = 'n', action = ':let @* = expand("%:t")<CR>', label = 'Copy current file name' },

	['gq'] = { mode = 'v', action = vim.lsp.buf.format, label = "format" }
}


------------------------------------------------------------------------------------------
-- Fuzzy Finder
------------------------------------------------------------------------------------------

local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local session_lens = require('session-lens')

mappings['fuzzy_finder'] = {
	['<Leader>ff'] = { mode = 'n', action = telescope_builtin.find_files, label = 'Find files' },
	['<Leader>fg'] = { mode = 'n', action = telescope.extensions.live_grep_args.live_grep_args, label = 'Live Grep' },
	['<Leader>fb'] = { mode = 'n', action = telescope_builtin.buffers, label = 'Find Buffers' },
	['<Leader>fh'] = { mode = 'n', action = telescope_builtin.help_tags, label = 'Find Help Tags' },
	['<Leader>fo'] = { mode = 'n', action = telescope_builtin.oldfiles, label = 'Find Old Files' },
	['<Leader>fl'] = { mode = 'n', action = telescope_builtin.resume, label = 'Last Search Results' },
	-- ['<Leader>fp'] = { mode = 'n', action = telescope.extensions.project.project, label = 'Last Search Results' },
	['<Leader>fp'] = { mode = 'n', action = session_lens.search_session, label = 'Last Search Results' },
	['<Leader>fxd'] = { mode = 'n', action = function() telescope_builtin.diagnostics { bufnr = 0 } end,
		label = 'Find Diagnostics in Focused Buffer' },
	['<Leader>fxw'] = { mode = 'n', action = telescope_builtin.diagnostics, label = 'Find Diagnostics in Open Buffers' },
	['gh'] = { mode = 'n', action = telescope_builtin.lsp_references, label = 'Find References' },
	['<Leader>/'] = {
		mode = 'n',
		action = function()
			require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end,
		label = 'Fuzzily search in current buffer'
	}
}

stems['<Leader>f'] = { label = 'Fuzzy Finder' }
stems['<Leader>fx'] = { label = 'Find Diagnostics' }


------------------------------------------------------------------------------------------
-- Testing
------------------------------------------------------------------------------------------

local neotest = require('neotest')

mappings['testing'] = {
	-- TODO: Revisit this later and see if there's clearer errors around it not working
	['<Leader>dn'] = { mode = 'n', action = function() neotest.run.run({ strategy = "dap" }) end,
		label = 'Debug Nearest Test' },
	['<Leader>un'] = { mode = 'n', action = function() neotest.run.run() end, label = 'Run Nearest Test' },
	['<Leader>ul'] = { mode = 'n', action = function() neotest.run.run_last() end, label = 'Run Last Test' },
	['<Leader>uf'] = { mode = 'n', action = function() neotest.run.run(vim.fn.expand("%")) end, label = 'Run File' },
	['<Leader>us'] = { mode = 'n', action = function() neotest.summary.open() end, label = 'Open Test Summary' },
	['<Leader>uo'] = { mode = 'n', action = function() neotest.output.open() end, label = 'Test Output' },
}

stems['<Leader>u'] = { label = 'Testing' }


------------------------------------------------------------------------------------------
-- Debugging
------------------------------------------------------------------------------------------

local dap_python = require('dap-python')
local dap = require('dap')
local dap_ui_widgets = require('dap.ui.widgets')
local dapui = require('dapui')

mappings['debug'] = {
	-- dap
	['<Leader>ds'] = { mode = 'v', action = dap_python.debug_selection, label = 'Debug Python Selection' },
	['<F9>'] = { mode = 'n', action = dap.continue, label = 'Debug Continue' },
	['<F10>'] = { mode = 'n', action = dap.step_over, label = 'Debug Step Over' },
	['<F11>'] = { mode = 'n', action = dap.step_into, label = 'Debug Step Into' },
	['<F12>'] = { mode = 'n', action = dap.step_out, label = 'Debug Step Out' },
	['<Leader>db'] = { mode = 'n', action = dap.toggle_breakpoint, label = 'Debug Toggle Breakpoint' },
	['<Leader>dsbr'] = {
		mode = 'n',
		action = function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
		label = 'Debug Set Breakpoint'
	},
	['<Leader>dsbm'] = {
		mode = 'n',
		action = function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
		label = 'Debug Set Breakpoint Message'
	},
	['<Leader>dr'] = { mode = 'n', action = dap.repl.open, label = 'Debug REPL' },
	-- ['<Leader>dl'] = { mode = 'n', action = dap.repl.run_last, label = 'Debug Run Last'},

	-- dap ui
	['<Leader>dui'] = { mode = 'n', action = dapui.toggle, label = 'Debug UI' },
	['<Leader>duh'] = { mode = 'n', action = dap_ui_widgets.hover, label = 'Debug Hover' },
	['<Leader>duf'] = { mode = 'n', action = (function() dap_ui_widgets.centered_float(dap_ui_widgets.scopes) end),
		label = 'Debug Scopes' },

	-- telescope-dap
	['<Leader>dcc'] = { mode = 'n', action = telescope.extensions.dap.commands, label = 'Debug Commands' },
	['<Leader>dco'] = { mode = 'n', action = telescope.extensions.dap.configurations, label = 'Debug Configurations' },
	-- ['<Leader>df'] = { mode = 'n', action = telescope.extensions.dap.frames, label = 'Debug Frames'},
}

stems['<Leader>d'] = { label = 'Debug' }
stems['<Leader>du'] = { label = 'Debug UI' }
stems['<Leader>dc'] = { label = 'Debug Telescope' }


------------------------------------------------------------------------------------------
-- LSP Mappings
------------------------------------------------------------------------------------------

local typescript = require("typescript")

mappings['lsp'] = {
	['gd'] = { mode = 'n', action = vim.lsp.buf.definition, label = 'Go to definition' },
	['gD'] = { mode = 'n', action = vim.lsp.buf.declaration, label = 'Go to declaration' },
	-- ['gi'] = { mode = 'n', action = vim.lsp.buf.implementation, label = 'Go to implementation' },
	['gs'] = { mode = 'n', action = vim.lsp.buf.signature_help, label = 'Signature help' },
	['gr'] = { mode = 'n', action = vim.lsp.buf.rename, label = 'Rename' },
	['gt'] = { mode = 'n', action = vim.lsp.buf.type_definition, label = 'Go to type definition' },
	['K'] = { mode = 'n', action = vim.lsp.buf.hover, label = 'Hover' },
	['ca'] = { mode = 'n', action = vim.lsp.buf.code_action, label = 'Code actions' },
	[']e'] = { mode = 'n', action = vim.diagnostic.goto_next, label = 'Next diagnostic' },
	['[e'] = { mode = 'n', action = vim.diagnostic.goto_prev, label = 'Previous diagnostic' },
	['<Leader>gw'] = { mode = 'n', action = vim.lsp.buf.document_symbol, label = 'Document symbols' },
	['<Leader>gW'] = { mode = 'n', action = vim.lsp.buf.workspace_symbol, label = 'Workspace symbols' },
	['<Leader>='] = { mode = 'n', action = vim.lsp.buf.format, label = 'Formatting' },
	['<Leader>-'] = { mode = 'n', action = vim.diagnostic.setloclist, label = 'diagnostic Locations' },

	['<Leader>gi'] = { mode = 'n', action = typescript.actions.addMissingImports, label = "Import Current" },
	['<Leader>rtf'] = { mode = 'n', action = ":TypescriptRenameFile<CR>", label = "Rename File" },
}


------------------------------------------------------------------------------------------
-- Git
------------------------------------------------------------------------------------------

local gitsigns = require('gitsigns')

mappings['git'] = {
	[']c'] = { mode = 'n', action = gitsigns.next_hunk, label = 'Next hunk' },
	['[c'] = { mode = 'n', action = gitsigns.prev_hunk, label = 'Previous hunk' },
	['<Leader>hs'] = { mode = 'n', action = gitsigns.stage_hunk, label = 'Stage hunk' },
	['<Leader>hu'] = { mode = 'n', action = gitsigns.undo_stage_hunk, label = 'Undo stage hunk' },
	['<Leader>hr'] = { mode = 'n', action = gitsigns.reset_hunk, label = 'Reset hunk' },
	['<Leader>hR'] = { mode = 'n', action = gitsigns.reset_buffer, label = 'Reset buffer' },
	['<Leader>hp'] = { mode = 'n', action = gitsigns.preview_hunk, label = 'Preview hunk' },
	['<Leader>hb'] = { mode = 'n', action = function() gitsigns.blame_line { full = true } end, label = 'Blame line' },
	['<Leader>hS'] = { mode = 'n', action = gitsigns.stage_buffer, label = 'Stage buffer' },
	['<Leader>hU'] = { mode = 'n', action = gitsigns.reset_buffer_index, label = 'Reset buffer index' },
}

stems['<Leader>h'] = { label = 'Git' }


------------------------------------------------------------------------------------------
-- Motions
------------------------------------------------------------------------------------------

local hop = require('hop')

mappings['motion'] = {
	['s'] = { mode = '', action = hop.hint_char2, label = 'Hint character', opts = { disable = false } },

	-- Quicker moving to front and back of lines
	['H'] = { mode = '', action = '^', label = 'Move to start of line' },
	['L'] = { mode = '', action = '$', label = 'Move to end of line' },

	['j'] = { mode = '', action = 'gj', label = 'Move down' },
	['k'] = { mode = '', action = 'gk', label = 'Move up' },
}


------------------------------------------------------------------------------------------
-- Tabs
------------------------------------------------------------------------------------------

mappings['tab'] = {
	['<Leader>ta'] = { mode = 'n', action = ':$tabnew<CR>', label = 'New tab' },
	['<Leader>tn'] = { mode = 'n', action = ':tabnext<CR>', label = 'Next tab' },
	['<Leader>tp'] = { mode = 'n', action = ':tabprevious<CR>', label = 'Previous tab' },
}

stems['<Leader>t'] = { label = 'Tabs' }


------------------------------------------------------------------------------------------
-- Terminal
------------------------------------------------------------------------------------------

-- local Terminal = require('toggleterm.terminal').Terminal

-- local horizontal = Terminal:new({ direction = 'horizontal' })
-- local float = Terminal:new({ direction = 'float' })
-- local lazydocker = Terminal:new({ cmd = 'lazydocker', hidden = true, direction = 'float' })

-- mappings['terminal'] = {
-- 	['<Leader>tt'] = { mode = 'n', action = function() horizontal:toggle() end, label = 'Toggle terminal' },
-- 	['<Leader>td'] = { mode = 'n', action = function() lazydocker:toggle() end, label = 'Toggle lazydocker' },
-- 	['<Leader>tf'] = { mode = 'n', action = function() float:toggle() end, label = 'Toggle float terminal' },
-- }


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
	if type(v.mode) == 'string' then
		v.mode = { v.mode }
	end

	for _, mode in ipairs(v.mode) do
		map(mode, k, v.action, v.opts, v.map_opts)
	end
end


------------------------------------------------------------------------------------------
-- Which Key
------------------------------------------------------------------------------------------

local which_key = require 'which-key'

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
