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

local lspconfig = require 'lspconfig'
local pid = vim.fn.getpid()

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
	-- https://web.archive.org/web/20230317233559/https://rudism.com/coding-csharp-in-neovim/
	-- https://nicolaiarocci.com/making-csharp-and-omnisharp-play-well-with-neovim/
	omnisharp = {
		on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
			-- Periodically check if this is stil required
			-- Right now semantic tokens provided by roslyn are causing issues
			client.server_capabilities.semanticTokensProvider = {
				full = vim.empty_dict(),
				legend = {
					tokenModifiers = { "static_symbol" },
					tokenTypes = {
						"comment",
						"excluded_code",
						"identifier",
						"keyword",
						"keyword_control",
						"number",
						"operator",
						"operator_overloaded",
						"preprocessor_keyword",
						"string",
						"whitespace",
						"text",
						"static_symbol",
						"preprocessor_text",
						"punctuation",
						"string_verbatim",
						"string_escape_character",
						"class_name",
						"delegate_name",
						"enum_name",
						"interface_name",
						"module_name",
						"struct_name",
						"type_parameter_name",
						"field_name",
						"enum_member_name",
						"constant_name",
						"local_name",
						"parameter_name",
						"method_name",
						"extension_method_name",
						"property_name",
						"event_name",
						"namespace_name",
						"label_name",
						"xml_doc_comment_attribute_name",
						"xml_doc_comment_attribute_quotes",
						"xml_doc_comment_attribute_value",
						"xml_doc_comment_cdata_section",
						"xml_doc_comment_comment",
						"xml_doc_comment_delimiter",
						"xml_doc_comment_entity_reference",
						"xml_doc_comment_name",
						"xml_doc_comment_processing_instruction",
						"xml_doc_comment_text",
						"xml_literal_attribute_name",
						"xml_literal_attribute_quotes",
						"xml_literal_attribute_value",
						"xml_literal_cdata_section",
						"xml_literal_comment",
						"xml_literal_delimiter",
						"xml_literal_embedded_expression",
						"xml_literal_entity_reference",
						"xml_literal_name",
						"xml_literal_processing_instruction",
						"xml_literal_text",
						"regex_comment",
						"regex_character_class",
						"regex_anchor",
						"regex_quantifier",
						"regex_grouping",
						"regex_alternation",
						"regex_text",
						"regex_self_escaped_character",
						"regex_other_escape",
					},
				},
				range = true,
			}
		end,
		cmd = {
			"dotnet",
			"/Users/kean.mattingly@equipmentshare.com/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll",
			"--languageserver",
			"--hostPID",
			tostring(pid)
		},
		-- Enables support for reading code style, naming convention and analyzer
		-- settings from .editorconfig.
		enable_editorconfig_support = true,
		-- If true, MSBuild project system will only load projects for files that
		-- were opened in the editor. This setting is useful for big C# codebases
		-- and allows for faster initialization of code navigation features only
		-- for projects that are relevant to code that is being edited. With this
		-- setting enabled OmniSharp may load fewer projects and may thus display
		-- incomplete reference lists for symbols.
		enable_ms_build_load_projects_on_demand = false,
		-- Enables support for roslyn analyzers, code fixes and rulesets.
		enable_roslyn_analyzers = true,
		-- Specifies whether 'using' directives should be grouped and sorted during
		-- document formatting.
		organize_imports_on_format = true,
		-- Enables support for showing unimported types and unimported extension
		-- methods in completion lists. When committed, the appropriate using
		-- directive will be added at the top of the current file. This option can
		-- have a negative impact on initial completion responsiveness,
		-- particularly for the first few completion sessions after opening a
		-- solution.
		enable_import_completion = true,
		-- Specifies whether to include preview versions of the .NET SDK when
		-- determining which version to use for project loading.
		sdk_include_prereleases = true,
		-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
		-- true
		analyze_open_documents_only = false,
	},

	-- csharp_ls = {
	-- 	-- handlers = {
	-- 	-- 	["textDocument/definition"] = require('csharpls_extended').handler,
	-- 	-- },
	-- 	cmd = { "csharp-ls" },
	-- },

	pyright = {},

	bashls = {},

	gopls = {},
}

for server, config in pairs(server_configs) do
	lspconfig[server].setup(config)
end
