-- set colorscheme to xxx with protected call
local status, _ = pcall(vim.cmd, "colorscheme NeoSolarized")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
