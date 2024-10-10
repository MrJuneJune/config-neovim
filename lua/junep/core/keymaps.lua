local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
-- Map semicolon to colon in normal mode
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = true })

-- Map hyphen to semicolon in normal mode
vim.api.nvim_set_keymap("n", "-", ";", { noremap = true, silent = true })

-- Map underscore to comma in normal mode
vim.api.nvim_set_keymap("n", "_", ",", { noremap = true, silent = true })

-- end of bracket for pointy
-- vim.opt.matchpairs:append("<:>")

-- Map a key combination to rerun the previous command (e.g., <leader>r)
-- vim.api.nvim_set_keymap('n', '<leader>r', ':execute 'normal @:'<CR>', { noremap = true, silent = true })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- tab management
keymap.set("n", "<leader>1", ":1gt<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>2", ":2gt<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>3", ":3gt<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>4", ":4gt<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>5", ":5gt<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>6", ":6gt<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>7", ":7gt<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>8", ":8gt<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>9", ":9gt<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>0", ":tablast<CR>", { noremap = true, silent = true })

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
-- keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab')) -- open in a newtab using t

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
