local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
config.color_scheme = "Gruvbox dark, soft (base16)"
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.9
config.default_cursor_style = "SteadyBar"
config.font_size = 14
config.enable_scroll_bar = true
config.window_frame = {
	font = wezterm.font({ family = "Fira Code" }),
}

return config
