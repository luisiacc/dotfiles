local wezterm = require("wezterm")

local cfg = {}

function OperatorMono()
	return {
		font = wezterm.font("Operator Mono Medium"),
		font_rules = {
			{ intensity = "Bold", font = wezterm.font("Operator Mono Bold") },
			{ italic = true, font = wezterm.font("Operator Mono Medium", { italic = true }) },
		},
	}
end

function SFMono()
	return {
		font = wezterm.font("SF Mono Semibold"),
		font_rules = {
			{ intensity = "Bold", font = wezterm.font("SF Mono Heavy") },
			{ italic = true, font = wezterm.font("SF Mono Semibold", { italic = true }) },
		},
	}
end

-- the comment
function MonoLisa()
	return {
		font = wezterm.font("MonoLisa-Medium"),
		font_rules = {
			{ intensity = "Bold", font = wezterm.font("MonoLisa-Black") },
			{ italic = true, font = wezterm.font("MonoLisa-MediumItalic") },
		},
	}
end

function OperatorMonoLig()
	return {
		font = wezterm.font("Operator Mono SSm Lig Medium"),
		font_rules = {
			{ intensity = "Bold", font = wezterm.font("Operator Mono SSm Lig Bold") },
			{ italic = true, font = wezterm.font("Operator Mono SSm Lig Medium", { italic = true }) },
		},
	}
end

function Hack()
	return {
		font = wezterm.font("Hack NF"),
		font_rules = {
			{ intensity = "Bold", font = wezterm.font("Hack NF Bold") },
		},
	}
end

function FiraCode()
	return {
		font = wezterm.font("Fira Code Medium"),
		font_rules = {
			{ intensity = "Bold", font = wezterm.font("Fira Code Bold") },
			{ italic = true, font = wezterm.font("Fira Code Medium", { italic = true }) },
		},
	}
end

function JetBrainsMono()
	return {
		font = wezterm.font("JetBrains Mono", { weight = "Medium" }),
		font_rules = {
			{ intensity = "Bold", font = wezterm.font("JetBrains Mono", { weight = "ExtraBold" }) },
		},
	}
end

function CascadiaCode()
	return {
		font = wezterm.font({ family = "Cascadia Code", harfbuzz_features = { "calt=1", "ss01=1", "ss19=1" } }),
	}
end

function Victor()
	return {
		font = wezterm.font("Victor Mono", { weight = "Medium" }),
	}
end

cfg.dpi = 144.0
cfg.font_size = 12 -- americanu erex tu
cfg.freetype_load_target = "Light"
cfg.freetype_render_target = "HorizontalLcd"
cfg.freetype_load_flags = "NO_HINTING"
cfg.line_height = 1.3
cfg.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
cfg.use_cap_height_to_scale_fallback_fonts = true

-- hola mamita como estas
local font_config = CascadiaCode()
cfg.font = font_config.font
cfg.font_rules = font_config.font_rules

return cfg
