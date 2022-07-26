local wezterm = require("wezterm")

local dir = {
	["h"] = "Left",
	["j"] = "Down",
	["k"] = "Up",
	["l"] = "Right",
}

local wsl_domains = wezterm.default_wsl_domains()
for _, dom in ipairs(wsl_domains) do
	dom.username = "acc"
end

local pwsh = "c:\\Program Files\\PowerShell\\7\\pwsh.exe"

local settings = {
	foreground_text_hsv = 1.5,
	default_prog = { pwsh },
	-- default_gui_startup_args = { "connect", "wsl" },
	default_gui_startup_args = { "start", "wsl" },
	-- Mix
	hide_tab_bar_if_only_one_tab = true,
	colors = {
		background = "#202020",
	},
	exit_behavior = "Close",
	adjust_window_size_when_changing_font_size = false,
	window_background_image = "c:\\personal\\fotos\\ideafoto\\black_clover\\a4.png",
	window_background_image_hsb = {
		brightness = 0.16,
		hue = 0.51,
	},
	text_background_opacity = 0.85,
	set_environment_variables = {
		TERMINFO_DIRS = "c:\\Users\\Luis\\terminfo",
		WSLENV = "TERMINFO_DIRS",
	},
	term = "wezterm",
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = dir["h"] }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = dir["j"] }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = dir["k"] }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = dir["l"] }) },
		{
			key = "1",
			mods = "LEADER",
			action = wezterm.action({ SpawnCommandInNewTab = { args = { pwsh } } }),
		},
		{
			key = "q",
			mods = "LEADER",
			action = wezterm.action({
				SpawnCommandInNewTab = { cwd = "~/", args = { pwsh, "-command", "nvim", "~/.wezterm.lua" } },
			}),
		},
		{ key = "t", mods = "LEADER|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ key = "5", mods = "CTRL|SHIFT|ALT", action = wezterm.action.SplitHorizontal({
			args = { "top" },
		}) },
	},
	ssh_domains = {
		{
			name = "wsl",
			username = "acc",
			remote_address = "192.168.50.2:2222",
			-- don't use persistent multiplexing; just do an ad-hoc connection
			multiplexing = "None",

			-- optionally change the default program just for this domain
			-- default_prog = {"fish"},

			-- Allows wezterm to do `cd DIR ; exec CMD` and respect cwd set by OSC 7
			assume_shell = "Posix",
		},
	},
	-- Makes FontAwesome's double-width glyphs display properly!
	-- !! this one opens a separate win on first unknown glyph, stealing windows focus !!
	warn_about_missing_glyphs = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}

local util = require("my_utils")

local full = util.merge_all(settings, require("cfg_fonts"), {})

return full
