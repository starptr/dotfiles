local module = {}

function module.get_mode(fallback_mode)
	print("yo call")
	local sys_theme_file = io.open(os.getenv("HOME").."/.config/day-n-nite/mode_config", "r")
	if not sys_theme_file then
		print("aaaa")
		io.stderr:write("day-n-nite mode config not found")
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

	io.stderr:write("Invalid day-n-nite mode")
	return fallback_mode
end

return module
