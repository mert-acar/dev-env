return {
	{ "L3MON4D3/LuaSnip", keys = {} },
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "*",
		config = function()
			require("blink.cmp").setup({
				snippets = { preset = "luasnip" },
				signature = { enabled = true },
				appearance = {
					use_nvim_cmp_as_default = false,
					nerd_font_variant = "normal",
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
					providers = {
						cmdline = {
							min_keyword_length = 2,
						},
					},
				},
				keymap = {
                    preset = 'none',
                    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                    ['<Tab>'] = { 'select_and_accept', 'fallback' },
                    ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
                    ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
				},
				completion = {
					keyword = { range = "full" },
					accept = { auto_brackets = { enabled = false } },
                    list = { selection = { preselect = false, auto_insert = true } },
					menu = {
						border = nil,
						scrolloff = 1,
						scrollbar = false,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", "label_description", gap = 1 },
								{ "kind" },
								{ "source_name" },
							},
						},
					},
					documentation = {
						window = {
							border = nil,
							scrollbar = false,
							winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						},
						auto_show = true,
						auto_show_delay_ms = 500,
					},
				},
			})

			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
