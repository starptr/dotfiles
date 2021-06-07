local wezterm = require 'wezterm';
local keybinds = require 'keybinds';
local appearance = require 'appearance';
local color_schemes = require 'color_schemes';

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

return {
	-- Keybinds
	leader = keybinds.leader,
	keys = keybinds.keys,

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
	font_rules = appearance.font_rule_sets['UbuntuMono NF'],
	color_scheme = "My Material",
	color_schemes = color_schemes,
}
