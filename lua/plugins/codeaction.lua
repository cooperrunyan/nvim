return {
  "weilbith/nvim-code-action-menu",
  cmd = "CodeActionMenu",
  keys = {
    { "<C-.>", "<cmd>CodeActionMenu<CR>" },
  },
  config = function()
    vim.g.code_action_menu_show_action_kind = false
    vim.g.code_action_menu_show_diff = true
    vim.g.code_action_menu_show_details = false
  end,
}
