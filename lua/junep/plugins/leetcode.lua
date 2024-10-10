-- Import leetcode.nvim plugin safely
local status, leetcode = pcall(require, "leetcode")
if not status then
	print(vim.inspect(vim.api.nvim_list_runtime_paths()))
	print("Hello wtf?")
	return
end

-- Setup leetcode with the custom configuration
leetcode.setup({
	arg = "leetcode.nvim",

	lang = "cpp",

	storage = {
		home = vim.fn.stdpath("data") .. "/leetcode",
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},

	plugins = {
		non_standalone = false,
	},

	logging = true,

	image_support = false,
})
