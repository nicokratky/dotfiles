local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

map('v', '<', '<gv')
map('v', '>', '>gv')

--map({'n', 'v'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--map({'n', 'v'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
