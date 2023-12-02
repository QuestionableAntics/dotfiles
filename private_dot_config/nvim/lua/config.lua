local opt = vim.opt
local wo = vim.wo
local o = vim.o

-- Let me backspace like I want
opt.backspace = { "indent", "eol", "start" }

-- Case insensitive searching
opt.ignorecase = true
-- If a capital is included, make the search case sensitive
opt.smartcase = true

-- Show completion popup menu in command view
opt.wildmenu = true
-- Completion popup menu options
opt.completeopt = {
	"menuone", -- always show the menu
	"noinsert", -- do not insert match until manually selected
	"noselect", -- do not auto select match
}

-- Set default grep to ripgrep (faster fuzzy finding)
opt.grepprg = [[rg\]] ---vimgrep

-- Set tab width to 4 spaces
opt.tabstop = 4

-- Set an indent to 4 spaces
opt.shiftwidth = 4

-- https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
vim.cmd([[filetype plugin indent on]])

-- How long before a swp file is written and a CursorHold event is triggered
-- Having longer updatetime (default is 4000 ms) leads to noticeable delays and poor user experience.
opt.updatetime = 100

-- Faster completion
opt.timeoutlen = 500

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

-- Maintain undo history between sessions
opt.undofile = true
opt.undodir = os.getenv("HOME") .. [[/.vim/undodir/]]
opt.undolevels = 10000

-- Recommended settings for auto-session via the readme file
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- Keep a buffer of 8 lines/columns between cursor and edge when scrolling
opt.scrolloff = 8

-- I save often enough
opt.swapfile = false

-- Always use system clipboard
opt.clipboard = "unnamed,unnamedplus"

-- Faster macros and less errors in complicated mappings
-- opt.lazyredraw = true

-- Better indenting
opt.smarttab = true
opt.smartindent = true

------------------------------------------------------------------------------------------
-- Visuals
------------------------------------------------------------------------------------------

-- Highlight the current line
opt.cursorline = true

-- ooo pretty colors o.o
opt.termguicolors = true

-- Allow for width of numbers and arbitrary symbols in sign column
opt.signcolumn = "yes:1"

-- Set the height of the command bar to 0 line
opt.cmdheight = 0

-- Hybrid line numbers: shows relative number for all lines, but shows absolute for current line
wo.relativenumber = true
wo.nu = true

------------------------------------------------------------------------------------------
-- Miscellaneous
------------------------------------------------------------------------------------------

-- where python packages used by plugins are installed to
vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/3.9.12/envs/nvim2/bin/python"

-- No noise please (no sound effects for errors)
opt.errorbells = false

-- Minimal Statusline
-- opt.statusline = ' %f %r %m%=%y %{&fileencoding?&fileencoding:&encoding}[%{&fileformat}] %p%% %l:%c '
