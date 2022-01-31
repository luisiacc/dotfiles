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

return {
	-- wsl_domains = wsl_domains,
	-- default_domain = "WSL:Ubuntu-18.04",
	default_prog = { pwsh },
	-- default_prog = { "c:\\Windows\\System32\\wsl.exe" },
	-- default_prog = { "ssh", "acc@192.168.50.2" },
	default_gui_startup_args = { "connect", "wsl" },
	font = wezterm.font("JetBrains Mono", { weight = "Medium" }),
	font_rules = {
		{ intensity = "Bold", font = wezterm.font("JetBrains Mono", { weight = "ExtraBold" }) },
	},
	freetype_load_target = "Light",
	freetype_render_target = "HorizontalLcd",
	line_height = 1.2,
	hide_tab_bar_if_only_one_tab = true,
	colors = {
		background = "#202020",
	},
	exit_behavior = "Close",
	adjust_window_size_when_changing_font_size = false,
	window_background_image = "d:\\Luisy\\fotos\\ideafoto\\black_clover\\a4.png",
	window_background_image_hsb = {
		brightness = 0.06,
		hue = 0.51,
	},
	text_background_opacity = 0.85,
	set_environment_variables = {
		TERMINFO_DIRS = "c:\\Users\\acc\\terminfo",
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
	},
	-- window_decorations = "RESIZE",
	-- allow_win32_input_mode = false
	ssh_domains = {
		{
			name = "wsl",
			username = "acc",
			remote_address = "192.168.50.1",
			-- don't use persistent multiplexing; just do an ad-hoc connection
			multiplexing = "None",

			-- optionally change the default program just for this domain
			-- default_prog = {"fish"},

			-- Allows wezterm to do `cd DIR ; exec CMD` and respect cwd set by OSC 7
			assume_shell = "Posix",
		},
	},
}
