
return {
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    build = "nvim -l build/init.lua",
    config = function()
      require("sg").setup({
        enable_cody = true,
      })

      -- Updated keybindings for Cody using <leader>y
      vim.keymap.set("n", "<leader>ya", ":CodyAsk ", { desc = "Cod[y] [A]sk" })
      vim.keymap.set("n", "<leader>yt", ":CodyTask ", { desc = "Cod[y] [T]ask" })
      vim.keymap.set("n", "<leader>yc", ":CodyChat<CR>", { desc = "Cod[y] [C]hat" })
      vim.keymap.set("v", "<leader>ye", ":<C-u>'<,'>CodyExplain<CR>", { desc = "Cod[y] [E]xplain Selection" })
      vim.keymap.set("n", "<leader>yr", ":CodyRestart<CR>", { desc = "Cod[y] [R]estart" })
    end,
  },
}
