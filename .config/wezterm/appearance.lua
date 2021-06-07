local wezterm = require 'wezterm';

local module = {}

module.font_rule_sets = {
	['FiraMono NF'] = {
		{
			italic = true,
			font = wezterm.font("Fira Mono", {italic=true}),
		},
		{
			italic = true,
			intensity = "Bold",
			font = wezterm.font("Fira Mono", {weight="Bold", italic=true}),
		},
		{
			intensity = "Bold",
			font = wezterm.font("FiraMono NF", {weight="Bold"}),
		},
	},
	['FiraCode NF'] = {
		{
			italic = true,
			font = wezterm.font("JetBrainsMono NF", {italic=true}),
		},
		{
			intensity = "Bold",
			font = wezterm.font("FiraCode NF", {weight="Bold"}),
		},
	},
	['JetBrainsMono NF'] = {
		-- Incomplete
		{
			italic = true,
			font = wezterm.font("JetBrainsMono NF", {weight="Medium", italic=true}),
		},
		{
			intensity = "Half",
			font = wezterm.font("JetBrainsMono NF", {weight="Light"}),
		}
	},
	["VictorMono NF"] = {
		{
			italic = true,
			font = wezterm.font("VictorMono NF", {italic=true}),
		},
		{
			italic = true,
			intensity = "Bold",
			font = wezterm.font("VictorMono NF", {weight="Bold", italic=true}),
		},
	},
	["UbuntuMono NF"] = {
		{
			intensity = "Bold",
			font = wezterm.font("UbuntuMono NF", {weight="Bold"}),
		},
	},
}

return module
