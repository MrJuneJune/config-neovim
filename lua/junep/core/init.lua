-- Because I sometimes use window
-- if vim.fn.has("wsl") == 1 then
-- 	vim.g.clipboard = {
-- 		name = "WSLClipboard",
-- 		copy = {
-- 			["+"] = "clip.exe",
-- 			["*"] = "clip.exe",
-- 		},
-- 		paste = {
-- 			["+"] = "powershell.exe -c Get-Clipboard",
-- 			["*"] = "powershell.exe -c Get-Clipboard",
-- 		},
-- 		cache_enabled = 0,
-- 	}
-- end
require("junep.core.options")
require("junep.core.keymaps")
require("junep.core.custom")
