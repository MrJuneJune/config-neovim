-- Set up Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins configuration
require("lazy").setup({
	-- Essential plugins
	{ "nvim-lua/plenary.nvim" }, -- Lua functions used by many plugins
	{ "MunifTanjim/nui.nvim" }, -- NUI library

	-- Colorscheme
	{ "bluz71/vim-nightfly-guicolors" },

	-- Navigation and window management
	{ "christoomey/vim-tmux-navigator" }, -- Tmux & split window navigation
	{ "szw/vim-maximizer" }, -- Maximizes and restores the current window

	-- Text manipulation
	{ "tpope/vim-surround" }, -- Add, delete, change surroundings easily

	-- File explorer
	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-tree/nvim-web-devicons" }, -- File icons for Neovim

	-- Status line
	{ "nvim-lualine/lualine.nvim" },

	-- Fuzzy Finder (Telescope)
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Improved sorter

	-- Autocompletion
	{ "hrsh7th/nvim-cmp" }, -- Autocompletion framework
	{ "hrsh7th/cmp-buffer" }, -- Buffer source for nvim-cmp
	{ "hrsh7th/cmp-path" }, -- Path source for nvim-cmp

	-- Snippets
	{ "L3MON4D3/LuaSnip" }, -- Snippet engine
	{ "saadparwaiz1/cmp_luasnip" }, -- Snippet source for nvim-cmp
	{ "rafamadriz/friendly-snippets" }, -- Collection of snippets

	-- LSP management
	{ "williamboman/mason.nvim" }, -- Manage LSP servers, linters, and formatters
	{ "williamboman/mason-lspconfig.nvim" }, -- Mason + LSPConfig integration
    { "jay-babu/mason-nvim-dap.nvim"}, -- neovim dap
	{ "neovim/nvim-lspconfig" }, -- Configure LSP servers
	{ "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp

	-- Treesitter (syntax highlighting)
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

	-- LSP UI enhancements
	{ "glepnir/lspsaga.nvim", branch = "main" },

	-- TypeScript enhancements
	{ "jose-elias-alvarez/typescript.nvim" },

	-- Linting & formatting
	{ "jose-elias-alvarez/null-ls.nvim" }, -- Configure formatters & linters
	{ "jayp0521/mason-null-ls.nvim" }, -- Bridge Mason & null-ls

	-- Debugging
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },

	-- Additional plugins
	{ "lervag/wiki.vim" }, -- Personal wiki

	-- Leetcode integration
	{
		"kawre/leetcode.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "MunifTanjim/nui.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "rcarriga/nvim-notify" },
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
})
