return {
  {
    'nvim-telescope/telescope.nvim',
    -- event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" },
    },
    keys = {
      { "<leader>ff",  ":Telescope find_files<cr>" },
      { "<leader>fG",  ":Telescope git_files<cr>" },
      { "<leader>fg",  ":Telescope live_grep<cr>" },
      { "<leader>fb",  ":Telescope buffers<cr>" },
      { "<leader>fh",  ":Telescope help_tags<cr>" },
      { "<leader>fa",  ":Telescope builtin<cr>" },
      { "<leader>fD",  ":Telescope diagnostics<cr>" },
      { "<leader>fk",  ":Telescope keymaps<cr>" },
      { "<leader>fr",  ":Telescope registers<cr>" },
      { "<leader>fv",  ":Telescope vim_options<cr>" },
      { "<leader>fc",  ":Telescope commands<cr>" },
      { "<leader>fC",  ":Telescope autocommands<cr>" },
      { "<leader>fm",  ":Telescope marks<cr>" },
      { "<leader>fhc", ":Telescope command_history<cr>" },
      { "<leader>fhs", ":Telescope search_history<cr>" },
    },
    config = function()
      local actions = require("telescope.actions")

      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<esc>"] = actions.close,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = {
              ["<esc>"] = actions.close,
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["?"] = actions.which_key,
            },
          },
          load_extensions = {
            "fzf-native",
            "ui-select",
          },
        },
      })
    end
  },

  {
    'nvim-telescope/telescope-symbols.nvim',
    keys = {
      { "<leader>fs", ":Telescope symbols<cr>" }
    },
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension('symbols')
    end
  },

  {
    "chip/telescope-software-licenses.nvim",
    keys = {
      { "<leader>fl", ":Telescope software-licenses find<cr>" },
    },
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension('software-licenses')
    end
  }

}
