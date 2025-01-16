local wezterm = require("wezterm")

-- https://wezfurlong.org/wezterm/config/
return {
	font = wezterm.font("Hack Nerd Font"),
	font_size = 14.0,

	max_fps = 120,

	enable_tab_bar = false,

	window_decorations = "RESIZE",

	window_close_confirmation = "NeverPrompt",

	window_padding = {
		left = 2,
		right = 0,
		top = 2,
		bottom = 0,
	},

	keys = {
		-- {
		-- 	key = "t",
		-- 	mods = "CMD",
		-- 	action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		-- },

		{ key = "t", mods = "CMD", action = wezterm.action.SendString("\x1b0") },
		{ key = "-", mods = "CMD", action = wezterm.action.SendString("\x1b-") },

		{ key = "1", mods = "CMD", action = wezterm.action.SendString("\x1b1") },
		{ key = "2", mods = "CMD", action = wezterm.action.SendString("\x1b2") },
		{ key = "3", mods = "CMD", action = wezterm.action.SendString("\x1b3") },
		{ key = "4", mods = "CMD", action = wezterm.action.SendString("\x1b4") },
		{ key = "5", mods = "CMD", action = wezterm.action.SendString("\x1b5") },

		{
			key = "f",
			mods = "CMD|SHIFT",
			action = wezterm.action.ToggleFullScreen,
		},
		-- Turn off the default CMD-m Hide action, allowing CMD-m to
		-- be potentially recognized and handled by the tab
		{
			key = "s",
			mods = "CMD",
			action = wezterm.action.SendString("\x1bw"),
			-- action = wezterm.action.DisableDefaultAssignment,
		},

		{
			key = "Backspace",
			mods = "CMD",
			action = wezterm.action.SendString("\x15"),
		},

		{
			key = "LeftArrow",
			mods = "OPT",
			action = wezterm.action.SendString("\x1bb"),
			-- action = act.SendKey({
			-- 	key = "b",
			-- 	mods = "ALT",
			-- }),
		},
		{
			key = "RightArrow",
			mods = "OPT",
			action = wezterm.action.SendString("\x1bf"),
			-- action = act.SendKey({ key = "f", mods = "ALT" }),
		},
	},
}
