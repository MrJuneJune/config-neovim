-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- on attach run these custom functions
local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

-- configure nvim-tree
nvimtree.setup({
	-- change folder arrow icons
	on_attach = my_on_attach,
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "*", -- arrow when folder is closed
					arrow_open = ".", -- arrow when folder is open
				},
			},
		},
	},
	filters = {
		dotfiles = false,
		git_ignored = false,
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	-- 	git = {
	-- 		ignore = false,
	-- 	},
})

-- open nvim-tree on setup

-- local function open_nvim_tree(data)
-- 	-- buffer is a [No Name]
-- 	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
--
-- 	-- buffer is a directory
-- 	local directory = vim.fn.isdirectory(data.file) == 1
--
-- 	if not no_name and not directory then
-- 		return
-- 	end
--
-- 	-- change to the directory
-- 	if directory then
-- 		vim.cmd.cd(data.file)
-- 	end
--
-- 	-- open the tree
-- 	require("nvim-tree.api").tree.open()
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
