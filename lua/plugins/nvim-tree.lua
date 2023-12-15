return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeFocus", "NvimTreeToggle", "NvimTreeOpen" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeFocus<CR>" },
  },
  event = "VeryLazy",
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    -- hijack_cursor = true,
    -- sync_root_with_cwd = true,
    -- select_prompts = true,
    -- prefer_startup_root = true,
    -- respect_buf_cwd = true,
    hijack_directories = {
      -- enable = true,
      -- auto_open = true,
    },
    update_focused_file = {
      enable = true,
      -- update_root = true,
      -- ignore_list = {},
    },
    actions = {
      open_file = {
        -- quit_on_open = true,
        window_picker = {
          enable = true,
        },
      },
      change_dir = {
        -- enable = true
      },
      remove_file = {
        close_window = true
      }
    },
    renderer = {
      highlight_opened_files = "none",
      highlight_git = true,
      highlight_diagnostics = true,
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
    git = {
      enable = true,
      ignore = false,
    },
    diagnostics = {
      enable = true,
    },
    tab = {
      sync = {
        open = true,
        close = true,
      },
    },
    notify = {
      absolute_path = false,
    },
    ui = {
      confirm = {
        -- remove = false,
        trash = false
      },
    },
    filters = {
      custom = {
        ".DS_Store",
        "yarn.lock",
        "package-lock.json",
        "^\\.git$"
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
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 'd', function() api.fs.trash(api.tree.get_node_under_cursor()) end, opts('Trash'))
      vim.keymap.set('n', '<C-CR>', function() api.tree.change_root_to_node(api.tree.get_node_under_cursor()) end,
        opts('Into'))
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    end,
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "goolord/alpha-nvim",
  },
  config = function(_, opts)
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup(opts)

    local function tab_win_closed(winnr)
      local api = require("nvim-tree.api")
      local tabnr = vim.api.nvim_win_get_tabpage(winnr)
      local bufnr = vim.api.nvim_win_get_buf(winnr)
      local buf_info = vim.fn.getbufinfo(bufnr)[1]
      local tab_wins = vim.tbl_filter(function(w)
        return w ~= winnr
      end, vim.api.nvim_tabpage_list_wins(tabnr))
      local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
      if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
        -- Close all nvim tree on :q
        if not vim.tbl_isempty(tab_bufs) then        -- and was not the last window (not closed automatically by code below)
          api.tree.close()
        end
      else                                                    -- else closed buffer was normal buffer
        if #tab_bufs == 1 then                                -- if there is only 1 buffer left in the tab
          local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
          if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
            vim.schedule(function()
              if #vim.api.nvim_list_wins() == 1 then          -- if its the last buffer in vim
                vim.cmd("quit")                               -- then close all of vim
              else                                            -- else there are more tabs open
                vim.api.nvim_win_close(tab_wins[1], true)     -- then close only the tab
              end
            end)
          end
        end
      end
    end

    vim.api.nvim_create_autocmd("WinClosed", {
      callback = function()
        local winnr = tonumber(vim.fn.expand("<amatch>"))
        tab_win_closed(winnr)
        -- vim.schedule_wrap(tab_win_closed(winnr))
      end,
      nested = true,
    })


    require("nvim-tree.api").tree.toggle({
      focus = vim.fn.argc() == 0,
      update_root = false,
    })
  end,
}
