local function create_cmake_template()
	local cmake_template = [[
cmake_minimum_required(VERSION 3.10)

# Export compile commands (useful for LSP tools)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_OSX_ARCHITECTURES "arm64")

project(foo VERSION 0.5
  DESCRIPTION "bar zoo"
  LANGUAGES CXX)

include_directories(include)

# Add all source files in the src directory
set(SOURCES
    main.cpp
)

# You can do this if needed
# file(GLOB SOURCES src/*.cpp)

add_executable(space_invader ${SOURCES})

# set the include and library paths manually because cmake can't find this.
set(raylib_INCLUDE_DIR /home/linuxbrew/.linuxbrew/opt/raylib/include)
set(raylib_LIBRARY /home/linuxbrew/.linuxbrew/opt/raylib/lib/libraylib.a)

# Third party
find_package(raylib REQUIRED)

# Include raylib headers
include_directories(${raylib_INCLUDE_DIR})

# Link raylib library after the executable target is created
target_link_libraries(foo PRIVATE ${raylib_LIBRARY})
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
