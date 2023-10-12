return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  lazy = true,
  event = "VeryLazy",
  opts = {},
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = { border = "none" },
    })

    mason_lspconfig.setup({
      automatic_installation = true,
      ensure_installed = {
        "html",
        "denols",
        "dockerls",
        "jsonls",
        "lua_ls",
        "rust_analyzer",
      },
    })
  end,
}
