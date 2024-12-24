return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"gopls",
				"jdtls",
				"lua_ls",
				"marksman",
				"pyright",
				"terraformls",
				"ts_ls",
				"typos_lsp",
				"tinymist",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.lsp.set_log_level("off")

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.marksman.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.terraformls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.tinymist.setup({ capabilities = capabilities, offset_encoding = "utf-8" })
			lspconfig.typos_lsp.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, {})
		end,
	},
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
	},
}
