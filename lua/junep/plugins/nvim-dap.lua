-- Safely import nvim-dap
local dap_setup, dap = pcall(require, "dap")
local dap_ui_setup, dapui = pcall(require, "dapui")
if not dap_setup then
	return
end

if not dap_ui_setup then
	print("dap ui not setup!") -- print error if colorscheme not installed
	return
end

-- Set up codelldb from Mason
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		-- Provide the path to the codelldb executable installed by Mason
		command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
		args = { "--port", "${port}" },
	},
}

-- Set the log level to TRACE to log detailed debug information
dap.set_log_level("TRACE")

-- Configuration for debugging C++ with CMake
dap.configurations.cpp = {
	{
		name = "Launch C++ with CMake",
		type = "codelldb",
		request = "launch",
		program = function()
			-- Run CMake and compile the project before debugging
			local build_dir = vim.fn.input("Path to build directory: ", vim.fn.getcwd() .. "/build", "file")

			-- Run cmake build system
			local cmake_build_cmd = "cmake --build " .. build_dir
			print("Building project with CMake...")
			vim.fn.system(cmake_build_cmd) -- Execute the build

			-- After building, get the path to the executable
			return vim.fn.input("Path to executable: ", build_dir .. "/main", "file")
		end,
		cwd = "${workspaceFolder}", -- Use current workspace folder
		stopOnEntry = false, -- Option to stop on entry
		args = {}, -- Arguments for the executable
		runInTerminal = false, -- Set to true if you want to run in a terminal
	},
}

-- Safely import dap actions or key mappings
local dap_mappings = function()
	local map = function(mode, lhs, rhs, opts)
		local options = { noremap = true, silent = true }
		if opts then
			options = vim.tbl_extend("force", options, opts)
		end
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	end

	-- Define key mappings for debugging using commands instead of Lua function calls
	map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
	map("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue the debugger" })
	map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step into" })
	map("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "Step over" })
	map("n", "<leader>ds", "<cmd>DapStepOut<CR>", { desc = "Step out" })
	map("n", "<leader>dq", "<cmd>DapTerminate<CR>", { desc = "Terminate debugger" })
end

-- Apply DAP key mappings
dap_mappings()

-- Reuse the C++ configuration for C
dap.configurations.c = dap.configurations.cpp

-- dap ui setup
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end

-- Keybindings to open the UI
vim.keymap.set("n", "<leader>du", dapui.toggle)
