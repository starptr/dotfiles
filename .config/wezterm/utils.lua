local module = {}

function module.is_unix()
	return package.config:sub(1,1) == '/'
end

function module.get_home()
	return (module.is_unix()
		and (os.getenv("HOME"))
		or (os.getenv("USERPROFILE")))
end

return module
