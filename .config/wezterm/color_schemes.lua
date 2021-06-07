local wezterm = require 'wezterm';

local module = {
	["My Material"] = {
		foreground = "#000000",
		background = "#ffffff",
		cursor_bg = "#4191e0",
		cursor_border = "#4191e0",
		cursor_fg = "#ffffff",
		selection_bg = "#909090",
		selection_fg = "#ffffff",
		ansi = {"#000000","#b7141f","#457b24","#f6981e","#134eb2","#560088","#0e717c","#ffffff"},
		brights = {"#101010", "#e83b3f", "#7aba3a", "#ff9d25", "#54a4f3", "#aa4dbc", "#26bbd1", "#efefef"},
	},
	["My Bright Dark Alacritty"] = {
		foreground = "#ffffff",
		background = "#000000",
		-- cursor_bg
		-- cursor_border
		-- cursor_fg
		cursor_bg = "#fec309",
		cursor_border = "#fec309",
		cursor_fg = "#000000",
		selection_bg = "#606060",
		selection_fg = "#000000",
		ansi = {"#000000","#fb0120","#00f769","#ebff87","#62d6e8","#d381c3","#a1efe4","#ffffff"},
	},
	["My Bright Lights"] = {
		foreground = "#b3c9d7",
		background = "#080808",
		cursor_bg = "#f34b00",
		cursor_border = "#f34b00",
		cursor_fg = "#002831",
		selection_bg = "#b3c9d7",
		selection_fg = "#191919",
		
		ansi = {"#191919","#ff355b","#b7e876","#ffc251","#76d4ff","#ba76e7","#6cbfb5","#c2c8d7"},
		brights = {"#191919","#ff355b","#b7e876","#ffc251","#76d5ff","#ba76e7","#6cbfb5","#c2c8d7"},
	},
	["My BlulocoDark"] = {
		foreground = "#f7f7f7",
		background = "#080808",
		cursor_bg = "#fec309",
		cursor_border = "#fec309",
		cursor_fg = "#000000",
		selection_bg = "#2f3441",
		selection_fg = "#abb2bf",
		
		ansi = {"#4a505d","#f81141","#23974a","#fd7e57","#285bff","#8c62fd","#366f9a","#ccd5e5"},
		brights = {"#61697a","#fc4a6d","#37bd58","#f6be48","#199ffd","#fc58f6","#50acae","#ffffff"},
	},
	["My BlulocoLight"] = {
		foreground = "#2a2c33",
		background = "#f7f7f7",
		cursor_bg = "#ed0047",
		cursor_border = "#ed0047",
		cursor_fg = "#ffffff",
		selection_bg = "#d2ecff",
		selection_fg = "#2a2c33",
		
		ansi = {"#cbccd5","#c90e42","#21883a","#d54d17","#1e44dd","#6d1bed","#1f4d7a","#000000"},
		brights = {"#dedfe8","#fc4a6d","#34b354","#b89427","#1085d9","#c00db3","#5b80ad","#1d1d22"},
	}
}

return module
