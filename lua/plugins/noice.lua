return {
  "folke/noice.nvim",
  -- event = "VeryLazy",
  lazy = false,
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      command_palette = true,
      long_message_to_split = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function(_, opts)
    require("notify").setup({
      render = "minimal",
      max_width = function()
        return math.floor(vim.o.columns * 0.5)
      end,
    })
    require("noice").setup(opts)
  end,
}
