local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>jd"] = {
			"<cmd> DapToggleBreakPoint <CR>",
			"debugger point",
		},
		["<leader>jr"] = {
			"<cmd> DapContinue <CR>",
			"continue debugger",
		},
	},
}

return M
