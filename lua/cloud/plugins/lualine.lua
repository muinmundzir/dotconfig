-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
local solarized_dark = require("lualine.themes.solarized_dark")

-- new colors for theme
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- change nightlfy theme colors
solarized_dark.normal.a.bg = new_colors.blue
solarized_dark.insert.a.bg = new_colors.green
solarized_dark.visual.a.bg = new_colors.violet
solarized_dark.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black, -- black
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = solarized_dark,
	},
})
