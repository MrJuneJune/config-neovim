local function create_cmake_template()
	local cmake_template = [[
cmake_minimum_required(VERSION 3.10)

# Export compile commands (useful for LSP tools)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_OSX_ARCHITECTURES "arm64")

set(SOURCES
    main.cpp
)
]]

	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(cmake_template, "\n"))
end

local function create_pyrightconfig()
	local pyright_template = [[
{
  "venvPath": "./",
  "venv": "/Users/mingtongyuan/june/python/side_project/epi_generator/life",
  "pythonVersion": "3.x",
  "reportMissingTypeStubs": false,
  "reportGeneralTypeIssues": false
}
]]

	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(pyright_template, "\n"))
end

local function create_make_template()
	local make_template = [[
all: compile

compile:
	mkdir -p build && cd build && cmake ../ && make -j
]]

	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(make_template, "\n"))
end
-- custom command
vim.api.nvim_create_user_command("CreateCMake", create_cmake_template, {})
vim.api.nvim_create_user_command("CreatePyright", create_pyrightconfig, {})
vim.api.nvim_create_user_command("CreateMake", create_make_template, {})
