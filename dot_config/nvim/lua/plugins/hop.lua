return {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      require("hop").setup()
      vim.keymap.set("n", "<leader>jw", ":HopWord<cr>", { silent = true, noremap = true })
    end
}
