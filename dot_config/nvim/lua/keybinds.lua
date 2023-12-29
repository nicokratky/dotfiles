local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "j", "gj")
map("n", "k", "gk")
