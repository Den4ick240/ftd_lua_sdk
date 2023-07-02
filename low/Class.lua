-- If you want to collapse contents of some files into one line
-- just add a comment exactly as below anywhere in the file:

-- ONE LINE

function Class(parent)
	local class = {}
	local mClass = {}
	class.__index = class
	mClass.__index = parent
	class.Super = parent
	function mClass:__call(...)
		local instance = setmetatable({}, class)
		if type(class.init) == "function" then
			return instance, instance:init(...)
		end
		return instance
	end
	return setmetatable(class, mClass)
end
