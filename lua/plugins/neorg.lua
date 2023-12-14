return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  ft = "norg",
  cmd = "Neorg",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "hrsh7th/nvim-cmp",
    "nvim-neorg/neorg-telescope",
  },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.highlights"] = {},
        ["core.manoeuvre"] = {},
        ["core.fs"] = {},
        ["core.looking-glass"] = {},
        ["core.qol.toc"] = {},
        ["core.qol.todo_items"] = {
          config = {
            order = {
              { "undone", " " },
              { "done",   "x" },
            }
          }
        },
        ["core.concealer"] = {},
        ["core.esupports.hop"] = {},
        ["core.esupports.indent"] = {
          config = {
            dedent_excess = true,
            format_on_enter = true,
            format_on_escape = true
          }
        },
        ["core.itero"] = {},
        ["core.clipboard.code-blocks"] = {},
        ["core.upgrade"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            name = "[Neorg]"
          }
        },
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
            neorg_leader = "<leader>"
          }
        },
        ["core.pivot"] = {},
        ["core.summary"] = {},
        ["core.syntax"] = {},
        ["core.scanner"] = {},
        ["core.clipboard"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.dirman.utils"] = {},
        ["core.storage"] = {},
        ["core.queries.native"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/dev/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
