return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  lazy = true,
  cmd = "Mason",
  opts = {
    ui = { border = "rounded" },
  },
}
