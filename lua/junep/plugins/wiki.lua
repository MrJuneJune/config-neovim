-- wiki.lua

-- Set the directory where your wiki pages will be stored
vim.g.wiki_root = "~/wiki/"

-- Set wiki syntax and file extensions
vim.g.wiki_filetypes = { "md", "wiki" }

-- Enable global mappings (optional)
vim.g.wiki_global_mappings = 1

-- Enable links to markdown files
vim.g.wiki_link_extension = ".md"
