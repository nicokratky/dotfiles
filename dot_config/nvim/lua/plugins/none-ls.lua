return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local mason_null_ls = require("mason-null-ls")

			mason_null_ls.setup({
				ensure_installed = nil,
				automatic_installation = true,
			})

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.terraform_fmt,
					null_ls.builtins.formatting.yamlfmt,
				},
			})

			vim.keymap.set("n", "<leader>gf", function()
				vim.lsp.buf.format({ timeout_ms = 2000 })
			end, {})
		end,
	},
}
