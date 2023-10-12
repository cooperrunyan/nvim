return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "tabs",      -- or "buffers"
      truncate_names = true, -- whether or not tab names should be truncated
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Files",
          text_align = "left",
          separator = true,
        },
      },
      tab_size = 22,
      max_name_length = 18,
      color_icons = true, -- whether or not to add the filetype icon highlights
      separator_style = "thin",
    },
  },
}
