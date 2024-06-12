---@type ChadrcConfig
---
local M = {}
M.ui = {
	theme = "gruvbox",
  transparency = true,
	hl_override = {
    CursorLineNr = {
      bg = "#282828",
      -- bg = "#FF279F",
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
