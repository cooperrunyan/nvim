local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "hint", "info" },
  symbols = { error = " ", warn = " ", hint = "󰌶", info = "󰋽" },
  colored = true,
  update_in_insert = true,
  always_visible = false,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local mode = {
  "mode",
  right_padding = 2,
  fmt = function(str)
    return str:sub(1, 1)
  end,
}

local filename = {
  "filename",
  file_status = false,
  newfile_status = false,
}

local filetype = {
  "filetype",
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "tokyonight",
      icons_enabled = true,
      -- fmt = string.lower,
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        NvimTree = {},
      },
    },
    sections = {
      lualine_a = { mode },
      lualine_b = { branch },
      lualine_c = { diagnostics },
      lualine_x = { filetype },
      lualine_y = { filename },
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { filetype },
      lualine_x = { filename },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = {
      "nvim-tree",
      "trouble",
      "man",
      "nvim-dap-ui",
      "fzf",
      "quickfix",
      "toggleterm",
    },
  },

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
