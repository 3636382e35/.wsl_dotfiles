---@type ChadrcConfig
---
local M = {}
M.ui = {
	theme = "gruvchad",
  transparency = true,
	hl_override = {
    CursorLineNr = {
      fg = "#eed123",
      bg = "#282828",
    },

    CursorLine = {
      bg = "#282828",
    },

    CursorColumn = {
      bg = "#282828",
    },
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}


-- test
return M
