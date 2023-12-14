return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    module = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      require('telescope').load_extension('dap')
      local dap = require('telescope').extensions.dap

      vim.keymap.set("n", "<leader>fdc", dap.commands)
      vim.keymap.set("n", "<leader>fdC", dap.configurations)
      vim.keymap.set("n", "<leader>fdb", dap.list_breakpoints)
      vim.keymap.set("n", "<leader>fdv", dap.variables)
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    keys = {
      { "<C-d>", function() require('dapui').toggle() end }
    },
    opts = {},
  }
}
