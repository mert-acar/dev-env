vim.lsp.enable({
	"lua_ls",
	"pyright",
})

vim.diagnostic.config({
	-- virtual_lines = true,
	-- virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local bufnr = args.buf
		-- Define buffer-local keymaps
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
		end

		-- LSP keymaps
		map("n", "<leader>vd", vim.diagnostic.open_float, "Show line diagnostics")
		map("n", "<leader>vr", vim.lsp.buf.rename, "Rename symbol")
		map("n", "<leader>va", vim.lsp.buf.code_action, "Code action")
		map("n", "gd", vim.lsp.buf.definition, "Go to definition")
		map("n", "gr", vim.lsp.buf.references, "Find references")
		map("n", "K", vim.lsp.buf.hover, "Show hover documentation")
		map("n", "<leader>vn", vim.diagnostic.goto_next, "Next diagnostic")
		map("n", "<leader>vp", vim.diagnostic.goto_prev, "Previous diagnostic")
		map("i", "<C-h>", vim.lsp.buf.signature_help, "Signiture help")
	end,
})
