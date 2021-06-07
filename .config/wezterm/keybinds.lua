local wezterm = require 'wezterm';

local module = {}

module.leader = { key="a", mods="CTRL", timeout_milliseconds=3000 }

module.keys = {
	-- Send <c-a> by pressing twice
	{ key="a", mods="LEADER|CTRL", action=wezterm.action{SendString="\x01"} },
	-- Split pane
	{ key="\"", mods="LEADER|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}} },
	{ key="%", mods="LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}} },
	-- Switch pane
	{ key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"} },
	{ key="h", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Left"} },
	--{ key="h", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Left"} },
	{ key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"} },
	{ key="l", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Right"} },
	--{ key="l", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Right"} },
	{ key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"} },
	{ key="j", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Down"} },
	--{ key="j", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Down"} },
	{ key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"} },
	{ key="k", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Up"} },
	--{ key="k", mods="LEADER|CTRL", action=wezterm.action{ActivatePaneDirection="Up"} },
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
}

return module
