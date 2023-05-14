require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { 'python' },
  },
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'latex', 'python', 'terraform', 'tsx', 'typescript', 'help', 'vim'},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,
})
