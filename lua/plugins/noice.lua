return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      -- command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
      bottom_search = true,
    },
    messages = {
      view = "mini",
    },
    notify = {
      view = "mini",
    },
    cmdline = {
      view = "cmdline",
    },
    hover = {
      silent = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- "rcarriga/nvim-notify",
  },
  -- config = function(_, opts)
  -- require("notify").setup({
  --   render = "minimal",
  --   max_width = function()
  --     return math.floor(vim.o.columns * 0.5)
  --   end,
  -- })
  -- require("noice").setup(opts)
  -- end,
}
