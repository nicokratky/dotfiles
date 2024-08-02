return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		sidebar_filetypes = {
			NvimTree = true,
		},
	},
	lazy = false,
	keys = {
		{ "<Tab>",           "<cmd>BufferNext<cr>" },
		{ "<S-Tab>",         "<cmd>BufferPrevious<cr>" },
		{ "<leader><Tab>",   "<cmd>BufferPick<cr>" },
		{ "<leader><S-Tab>", "<cmd>BufferPickDelete<cr>" },
		{ "<leader>c",       "<cmd>BufferClose<cr>" },
		{ "<S-t>",           "<cmd>tabnew<cr>" },
	},
}
