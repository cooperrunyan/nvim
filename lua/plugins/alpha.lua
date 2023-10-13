return {
  "goolord/alpha-nvim",
  config = function()
    local welcome = require("welcome")
    local alpha = require("alpha")

    vim.api.nvim_set_hl(0, "Banner", {
      cterm = { bold = true, italic = true },
      fg = "#db4b4b",
      bold = true,
      italic = true,
    })
    local msg = welcome.msg
    math.randomseed(os.time())

    alpha.setup({
      opts = {
        shrink_margin = false,
      },
      layout = {
        { type = "padding", val = 2 },
        {
          type = "text",
          opts = {
            position = "center",
            hl = "Banner",
          },
          val = welcome.banner,
        },
        { type = "padding", val = 1 },
        {
          type = "text",
          val = msg("The only winning move is not to play."),
          opts = {
            position = "center",
            hl = "Bold",
          },
        },
        {
          type = "text",
          val = msg("How about a nice game of chess?"),
          opts = {
            position = "center",
            hl = "Italic",
          },
        },
        { type = "padding", val = 2 },

        {
          type = "text",
          val = welcome.quotes[math.random(#welcome.quotes)],
          opts = {
            position = "center",
            hl = "Comment",
          },
        },
      },
    })
  end,
}
