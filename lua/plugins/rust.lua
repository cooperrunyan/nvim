return {
	{
		"rust-lang/rust.vim",
		lazy = true,
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"rust-lang/rust.vim",
		},
		lazy = true,
	},
	{ "mfussenegger/nvim-dap", event = "VeryLazy" },
}
