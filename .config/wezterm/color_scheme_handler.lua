local utils = require 'utils';

local module = {}

function module.get_mode(fallback_mode)
	local sys_theme_path = utils.get_home()..(utils.is_unix()
		and "/.config/day-n-nite/mode_config"
		or "\\.config\\day-n-nite\\mode_config")
	local sys_theme_file = io.open(sys_theme_path, "r")

	if not sys_theme_file then
		print("day-n-nite mode config not found")
		return fallback_mode
	end

	local mode = sys_theme_file:read "*a"
	sys_theme_file:close()

	if mode == "Day" then
		-- NOTE: set this to the light theme in color_schemes
		return "My Material"
	elseif mode == "Night" then
		-- Note: set this to the dark theme in color_schemes
		return "My Bright Dark Alacritty"
	end

	print("Invalid day-n-nite mode")
	return fallback_mode
end

return module
