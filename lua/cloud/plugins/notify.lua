local ok_status, notify = pcall(require, "notify")

if not ok_status then
	return
end

notify.setup({
	background_colour = "#65D1FF",
	timeout = 1000,
})
