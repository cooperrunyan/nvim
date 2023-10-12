return {
  "saecki/crates.nvim",
  event = { "VeryLazy", "BufEnter *.rs", "BufEnter *.toml" },
  dependencies = { "nvim-lua/plenary.nvim", "jose-elias-alvarez/null-ls.nvim" },
  ft = { "rust", "toml" },
  opts = {
    null_ls = {
      enabled = true,
    },
    src = {
      cmp = {
        enabled = true,
      },
    },
  },
}
