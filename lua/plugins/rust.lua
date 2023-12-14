return {
  {
    "rust-lang/rust.vim",
    lazy = true,
    ft = "rust",
    module = false,
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    module = false,
    dependencies = {
      "rust-lang/rust.vim",
    },
    lazy = true,
  },
}
