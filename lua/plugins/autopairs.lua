return {
  "windwp/nvim-autopairs",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
    })
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
  end,
}
