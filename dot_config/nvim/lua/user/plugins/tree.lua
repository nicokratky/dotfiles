require('nvim-tree').setup()

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', { silent = true, noremap = true })
