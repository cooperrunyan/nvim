return {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {
    style = "night",
    transparent = false,
    terminal_colors = true,
    styles = {
      sidebars = "transparent",
      floats = "dark",
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd([[colorscheme tokyonight]])
  end,
}
