return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeFocus", "NvimTreeToggle", "NvimTreeOpen" },
	keys = {
		{ "<leader>e", "<cmd>NvimTreeFocus<CR>" },
	},
	opts = {
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true,
		renderer = {
			highlight_opened_files = "none",
			highlight_git = true,
			highlight_diagnostics = true,
			indent_markers = {
				enable = false,
			},
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},

				glyphs = {
					default = "󰈚",
					symlink = "",
					folder = {
						default = "",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
						symlink_open = "",
						arrow_open = "",
						arrow_closed = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		actions = {
			open_file = {
				-- quit_on_open = true,
				window_picker = {
					enable = false,
				},
			},
		},
		git = {
			enable = true,
			ignore = false,
		},
		diagnostics = {
			enable = true,
		},
		tab = {
			sync = {
				open = true,
				close = true,
			},
		},
		notify = {
			absolute_path = false,
		},
		ui = {
			confirm = {
				remove = false,
			},
		},
		update_focused_file = {
			enable = true,
			update_cwd = true,
			-- ignore_list = {},
			update_root = true,
		},
		filters = {
			--		dotfiles = true,
			custom = {
				".DS_Store",
				"yarn.lock",
				"package-lock.json",
				".git",
			},
		},
		view = {
			width = 30,
			preserve_window_proportions = true,
			adaptive_size = false,
			side = "left",
		},
		filesystem_watchers = {
			enable = true,
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function(_, opts)
		vim.g.loaded = 1
		vim.g.loaded_netrwPlugin = 1

		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		require("nvim-tree").setup(opts)

		local function tab_win_closed(winnr)
			local api = require("nvim-tree.api")
			local tabnr = vim.api.nvim_win_get_tabpage(winnr)
			local bufnr = vim.api.nvim_win_get_buf(winnr)
			local buf_info = vim.fn.getbufinfo(bufnr)[1]
			local tab_wins = vim.tbl_filter(function(w)
				return w ~= winnr
			end, vim.api.nvim_tabpage_list_wins(tabnr))
			local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
			if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
				-- Close all nvim tree on :q
				if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
					api.tree.close()
				end
			else -- else closed buffer was normal buffer
				if #tab_bufs == 1 then -- if there is only 1 buffer left in the tab
					local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
					if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
						vim.schedule(function()
							if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
								vim.cmd("quit") -- then close all of vim
							else -- else there are more tabs open
								vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
							end
						end)
					end
				end
			end
		end

		vim.api.nvim_create_autocmd("WinClosed", {
			callback = function()
				local winnr = tonumber(vim.fn.expand("<amatch>"))
				tab_win_closed(winnr)
				-- vim.schedule_wrap(tab_win_closed(winnr))
			end,
			nested = true,
		})
	end,
}
