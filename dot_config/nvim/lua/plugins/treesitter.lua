return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")

    config.setup({
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = { "python" },
      },
      ensure_installed = {
        "c",
        "cpp",
        "go",
        "latex",
        "lua",
        "python",
        "query",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
      auto_install = false,
    })
  end
}
