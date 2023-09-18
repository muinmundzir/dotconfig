-- import indent-blankline plugin safely
local setup, indent_blankline = pcall(require, "indent_blankline")
if not setup then
	return
end

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
})
