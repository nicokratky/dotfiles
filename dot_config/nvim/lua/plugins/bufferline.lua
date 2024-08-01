return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		options = {
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
	keys = {
		{ "<Tab>",           "<cmd>BufferLineCycleNext<cr>" },
		{ "<S-Tab>",         "<cmd>BufferLineCyclePrev<cr>" },
		{ "<leader><Tab>",   "<cmd>BufferLinePick<cr>" },
		{ "<leader><S-Tab>", "<cmd>BufferLinePickClose<cr>" },
		{ "<leader>c",       "<cmd>bdelete!<cr>" },
		{ "<S-t>",           "<cmd>tabnew<cr>" },
	},
}
