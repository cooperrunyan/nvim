return {
  "williamboman/mason-lspconfig.nvim",
  lazy = true,
  opts = {
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
    },
  }
}
