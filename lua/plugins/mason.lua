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
  config = function(_, opts)
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup(opts)

    mason_lspconfig.setup({
      automatic_installation = true,
      ensure_installed = {
        "html",
        "denols",
        "dockerls",
        "jsonls",
        "lua_ls",
        "cssls",
        "rust_analyzer",
        "dotls",
        "tsserver",
        "yamlls",
        "taplo",
        "bashls",
        "texlab",
        "biome",
        "efm",
        "sumneko_lua",
        "glow"
      },
    })
  end,
}
