function RunBazel(cmd, flags)
	local full_path = vim.fn.expand("%:p:h")
	local project_root = vim.fn.finddir("wmg2-external-apps", full_path .. ";")
	local relative_path = vim.fn.fnamemodify(full_path, ":~:.")

	-- Get the word under the cursor
	local cursor_word = vim.fn.expand("<cWORD>"):match("[^%s,;]+")

	-- Check if cursor_word is empty and set it to ':all' if it is
	if cursor_word == nil then
		cursor_word = ":all"
	else
		cursor_word = ":" .. cursor_word
	end

	if relative_path ~= "~/warner/wmg2-external-apps" then
		vim.cmd("vsplit build")
		vim.cmd("terminal bazel " .. cmd .. " //" .. relative_path .. cursor_word .. " " .. flags)
	--        vim.cmd('terminal bazel build ' .. relative_path .. cursor_word .. command)
	else
		vim.cmd("vsplit build")
		vim.cmd("terminal bazel " .. cmd(" ...") .. " " .. flags)
	end
end

-- Define the function to print the current date
function PrintDate()
	local date = os.date("%Y-%m-%d") -- Get the current date in YYYY-MM-DD format
	-- Insert the date at the current cursor position
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	local current_line = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
	local new_line = current_line:sub(1, col) .. date .. current_line:sub(col + 1)
	vim.api.nvim_buf_set_lines(0, line - 1, line, true, { new_line })
	-- Move the cursor after the inserted date
	vim.api.nvim_win_set_cursor(0, { line, col + #date })
end

-- Key mappings
vim.api.nvim_set_keymap(
	"n",
	"<leader>lint",
	[[:lua RunBazel('test', "--test_tag_filters=lint --build_tests_only")<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>test",
	[[:lua RunBazel('test', "--test_tag_filters=jest --build_tests_only")<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>build", [[:lua RunBazel('build', "")<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>run", [[:lua RunBazel('run', "")<CR>]], { noremap = true, silent = true })

-- vim wiki
vim.g.wiki_root = "~/wiki"

-- Map the function to <leader>d
-- vim.api.nvim_set_keymap("n", "<leader>d", "[[:lua PrintDate()<CR>]]", { noremap = true, silent = true })
