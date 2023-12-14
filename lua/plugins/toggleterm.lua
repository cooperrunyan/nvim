return {
  {
    "akinsho/nvim-toggleterm.lua",
    -- event = "VeryLazy",
    opts = {
      open_mapping = "<c-t>"
    },
    keys = {
      { "<leader>t", ":ToggleTerm<cr>" },
      { "<c-t>",     mode = { "i", "n", "t", "v" } }
    }
  },
  {
    "ryanmsnyder/toggleterm-manager.nvim",
    keys = {
      { "<leader>ft", ":Telescope toggleterm_manager<cr>" }
    },
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
    },
    config = true
  }
}
