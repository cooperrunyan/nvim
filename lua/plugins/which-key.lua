return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = false,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  cmd = "WhichKey"
}
