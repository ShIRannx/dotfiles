-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local c = wezterm.config_builder()

c.initial_cols = 96
c.initial_rows = 24

c.window_close_confirmation = "NeverPrompt"
c.front_end = "WebGpu"
c.webgpu_power_preference = "HighPerformance"

c.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
c.hide_tab_bar_if_only_one_tab = true

-- c.enable_scroll_bar = true
c.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

c.default_prog = { "C:/Windows/system32/wsl.exe", "-d", "Debian" }

c.launch_menu = {
	{ label = "CMD", args = { "cmd.exe" } },
	{
		label = "JumpServer",
		args = {
			"C:/Windows/system32/wsl.exe",
			"--",
			"ssh",
			"-i",
			"~/.ssh/shenzijian-jumpserver.key",
			"-p5678",
			"shenzijian@j.ops.gyyx.cn",
		},
	},
}

local act = wezterm.action
c.keys = {
	{
		key = "9",
		mods = "ALT",
		action = wezterm.action.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" }),
	},
	{ key = "u", mods = "SHIFT|CTRL", action = act.ScrollByPage(-1) },
	{ key = "d", mods = "SHIFT|CTRL", action = act.ScrollByPage(1) },
	{ key = "f", mods = "CTRL|ALT", action = act.ToggleFullScreen },
	{ key = "h", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "l", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },
	{ key = "w", mods = "ALT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "t", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
}

c.font = wezterm.font("Agave Nerd Font Mono")
c.color_scheme = "tokyonight_moon"
c.font_size = 21

return c
