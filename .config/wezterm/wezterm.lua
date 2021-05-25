local wezterm = require 'wezterm';

-- Settings depending on OS
if package.config:sub(1,1) == '\\' then
	-- windows
	default_prog = {"powershell.exe"}
	wsl_domain = {
		name = "wsl",
		serve_command = {"wsl", "wezterm-mux-server", "--daemonize"},
	}
else
	-- unix
	default_prog = {"zsh", "-l"}
	wsl_domain = {
		name = "wsl",
		socket_path = "/mnt/c/Users/yuyun/.local/share/wezterm/sock",
		skip_permissions_check = true,
	}
end

return {
	default_prog = default_prog,

	ssh_domains = {
		{
			name = "wslssh",
			remote_address = "localhost:2222",
			no_agent_auth = true,
			username = "yuto",
		}
	},
	--unix_domains = {
	--	wsl_domain,
	--},

	font = wezterm.font("UbuntuMono NF"),
	color_scheme = "My BlulocoDark",
	-- color_scheme = "BlulocoLight"
	color_schemes = {
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
			foreground = "#abb2bf",
			background = "#080808",
			cursor_bg = "#fec309",
			cursor_border = "#fec309",
			cursor_fg = "#ffffff",
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
