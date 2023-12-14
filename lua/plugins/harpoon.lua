return {
  'theprimeagen/harpoon',
  keys = {
    "<leader>a", "<C-e>"
  },
  config = function()
    local ui = require('harpoon.ui')
    local mark = require('harpoon.mark')

    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
  end
}
