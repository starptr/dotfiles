local wezterm = require 'wezterm';

-- Settings depending on OS
if package.config:sub(1,1) == '\\' then
	-- windows
	default_prog = {"powershell.exe"}
	--wsl_domain = {
	--	name = "wsl",
	--	serve_command = {"wsl", "wezterm-mux-server", "--daemonize"},
	--}
else
	-- unix
	default_prog = {"zsh", "-l"}
	--wsl_domain = {
	--	name = "wsl",
	--	socket_path = "/mnt/c/Users/yuyun/.local/share/wezterm/sock",
	--	skip_permissions_check = true,
	--}
end

font_rule_sets = {
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

return {
	-- Keybinds
	leader = { key="a", mods="CTRL", timeout_milliseconds=3000 },
	keys = {
		-- Send <c-a> by pressing twice
		{ key="a", mods="LEADER|CTRL", action=wezterm.action{SendString="\x01"} },
		-- Split pane
		{ key="\"", mods="LEADER|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}} },
		{ key="%", mods="LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}} },
		-- Switch pane
		{ key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"} },
		{ key="h", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Left"} },
		{ key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"} },
		{ key="l", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Right"} },
		{ key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"} },
		{ key="j", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Down"} },
		{ key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"} },
		{ key="k", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Up"} },
		-- New tab
		{ key="c", mods="LEADER", action=wezterm.action{SpawnTab="CurrentPaneDomain"} },
		-- List tabs
		{ key="w", mods="LEADER", action="ShowTabNavigator" },
		-- Activate neighboring tabs
		{ key="n", mods="LEADER", action=wezterm.action{ActivateTabRelative=1} },
		{ key="n", mods="LEADER|CTRL", action=wezterm.action{ActivateTabRelative=1} },
		{ key="p", mods="LEADER", action=wezterm.action{ActivateTabRelative=-1} },
		{ key="p", mods="LEADER|CTRL", action=wezterm.action{ActivateTabRelative=-1} },
		-- Close tab
		{ key="&", mods="LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}} },
		-- Close pane
		{ key="d", mods="LEADER|CTRL", action=wezterm.action{CloseCurrentPane={confirm=true}} },
	},

	-- Remote domains
	default_prog = default_prog,

	ssh_domains = {
		{
			name = "wslssh",
			remote_address = "localhost:2222",
			no_agent_auth = true,
			username = "yuto",
		}
	},
	-- unix_domains = {
	-- 	wsl_domain,
	-- },

	-- Appearance
	--freetype_load_target = "Normal",
	--font_anatialias = "Greyscale",
	--font_hinting = "None",
	
	-- Mono suffix refers to No-Liga NFs only
	-- FiraMono is No-Liga version of FiraCode
	font = wezterm.font("UbuntuMono NF"),
	font_size = 13,
	font_rules = font_rule_sets['UbuntuMono NF'],
	color_scheme = "My Bright Dark Alacritty",
	-- color_scheme = "BlulocoLight"
	color_schemes = {
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
	},
}
