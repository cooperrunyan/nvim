return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>e", "<cmd>NvimTreeFocus<CR>" },
  },
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    renderer = {
      highlight_opened_files = "none",
      indent_markers = {
        enable = false,
      },
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },

        glyphs = {
          default = "󰈚",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    actions = {
      open_file = {
        -- quit_on_open = true,
        window_picker = {
          enable = false,
        },
      },
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      -- ignore_list = {},
      update_root = true,
    },
    filters = {
      --		dotfiles = true,
      custom = {
        ".DS_Store",
        "yarn.lock",
        "package-lock.json",
        ".git",
      },
    },
    view = {
      width = 30,
      preserve_window_proportions = true,
      adaptive_size = false,
      side = "left",
    },
    filesystem_watchers = {
      enable = true,
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function(_, opts)
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1

    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    require("nvim-tree").setup(opts)
  end,
}
