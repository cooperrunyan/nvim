return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require("telescope").load_extension("ui-select")
    end
  },

}
