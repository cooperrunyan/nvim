return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
    },
    ft = "rust",
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          standalone = false,
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>rc", rt.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>rp", rt.parent_module.parent_module, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>rr", "<cmd>RustRun<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<Leader>rt", "<cmd>RustTest!<CR>", { buffer = bufnr })
            --
            -- vim.opt.updatetime = 100
            --
            -- local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
            --
            -- vim.api.nvim_create_autocmd("CursorHold", {
            --   callback = function()
            --     vim.diagnostic.open_float(nil, { focusable = false })
            --   end,
            --   group = diag_float_grp,
            -- })
            --
            -- vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)
            -- vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)
          end,
        },
      })
    end,
  },
  "mfussenegger/nvim-dap",
}
