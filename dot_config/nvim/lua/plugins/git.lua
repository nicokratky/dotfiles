return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "tpope/vim-rhubarb"
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")
    end
  }
}
