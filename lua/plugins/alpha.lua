return {
	"goolord/alpha-nvim",
	config = function()
		local welcome = require("welcome")
		local alpha = require("alpha")
		local utils = require("utils")
		local width = welcome.line

		vim.api.nvim_set_hl(0, "Banner", {
			cterm = { bold = true, italic = true },
			fg = "#db4b4b",
			bold = true,
			italic = true,
		})
		local msg = utils.msg
		math.randomseed(os.time())

		local clck = utils.clock_speed()
		local avail = utils.avail_ram()
		local total = utils.total_ram()
		local user = utils.user()
		local host = utils.host()
		local clck_len = string.len(clck)
		local avail_len = string.len(avail)
		local total_len = string.len(total)
		local user_len = string.len(user)

		alpha.setup({
			opts = {
				margin = 10,
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
					val = utils.line(
						"USER: " .. user .. "  HOST: " .. host,
						width,
						"The only winning move is not to play."
					),
					opts = {
						position = "center",
						hl = {
							{ "DiagnosticUnnecessary", 0, 5 },
							{ "DiagnosticUnnecessary", user_len + 8, user_len + 13 },
							{ "Bold", 51, -1 },
						},
					},
				},
				{
					type = "text",
					val = utils.line(
						"CLOCK: " .. clck .. "  RAM: " .. avail .. " / " .. total,
						width,
						"How about a nice game of chess?"
					),
					opts = {
						position = "center",
						hl = {
							{ "DiagnosticUnnecessary", 0, 6 },
							{ "DiagnosticUnnecessary", 7 + clck_len + 2, 7 + clck_len + 2 + 4 },
							{ "Number", 7 + clck_len + 2 + 5, 7 + clck_len + 2 + 5 + avail_len },
							{
								"Number",
								7 + clck_len + 2 + 5 + avail_len + 3,
								7 + clck_len + 2 + 5 + avail_len + 3 + total_len,
							},
							{ "Italic", 57, -1 },
						},
					},
				},
				{
					type = "text",
					val = msg("UPTIME: " .. utils.uptime()),
					opts = {
						position = "center",
						hl = { { "DiagnosticUnnecessary", 0, 7 }, { "Normal", 8, -1 } },
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
