return {
  {
    "rust-lang/rust.vim",
    lazy = true,
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
      "rust-lang/rust.vim",
    },
    lazy = true,
  },
  { "mfussenegger/nvim-dap", event = "LspAttach" },
}
