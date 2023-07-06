-- IMPORT EXAMPLE/CLASS
function Class(parent) 	local class = {} 	local mClass = {} 	class.__index = class 	mClass.__index = parent 	class.Super = parent 	function mClass:__call(...) 		local instance = setmetatable({}, class) 		if type(class.init) == "function" then 			return instance, instance:init(...) 		end 		return instance 	end 	return setmetatable(class, mClass) end

-- IMPORT EXAMPLE/EXAMPLECLASS
ExampleClass = Class()

function ExampleClass:init(I)
	self.I = I
end

function ExampleClass:foo()
	self.I:LogToHud("Hello World!")
end

-- IMPORT TEST/TEST
function Update(I)
	local exampleObject = ExampleClass(I)
	exampleObject:foo()
end