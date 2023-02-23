local util = require("lspconfig.util")


------------------------------------------------------------------------------------------
-- Config
------------------------------------------------------------------------------------------

-- Source is automatically added, you just need to include it in the chain complete list
vim.g.completion_chain_complete_list = {
	sql = {
		complete_items = { 'vim-dadbod-completion' }
	}
}

-- Auto start coq (must be run before require 'coq')
vim.g.coq_settings = {
	-- always start coq (silently)
	-- auto_start = 'shut-up',
	-- this takes over <C-h>?
	keymap = { jump_to_mark = '' },
	-- a lot of what I want from autocomplete is exploring properties on objects
	-- this makes those properties more visible in large projects by prioritizing lsp results
	clients = { lsp = { weight_adjust = 1.6 } }
}


------------------------------------------------------------------------------------------
-- Setup
------------------------------------------------------------------------------------------

local coq = require 'coq'
local lspconfig = require 'lspconfig'

-- Add more paths to the lua package search path
local lua_rtp = vim.split(package.path, ";")
table.insert(lua_rtp, "lua/?.lua")
table.insert(lua_rtp, "lua/?/init.lua")

local server_configs = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = lua_rtp,
				},
				diagnostics = { globals = { "vim", "coq" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file('', true),
				},
				telemetry = {
					enable = false,
				},
			},
		}
	},

	eslint = {},

	-- Setup guide for C#
	-- https://rudism.com/coding-csharp-in-neovim/
	omnisharp = {
		on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		end,
		cmd = {
			"/Users/kean.mattingly@equipmentshare.com/Downloads/omnisharp-osx/run",
			"--languageserver",
			"--hostPID",
			tostring(pid)
		},
	},

	pyright = {},

	bashls = {},
}

for server, config in pairs(server_configs) do
	-- LSP Snippets
	lspconfig[server].setup(coq.lsp_ensure_capabilities(config))
end


------------------------------------------------------------------------------------------
-- Typescript Specific Setup
------------------------------------------------------------------------------------------

local tsserver = {
	root_dir = util.root_pattern("package.json"),
	init_options = {
		lint = true,
	},
}

require('typescript').setup(coq.lsp_ensure_capabilities(tsserver))
