-- IMPORT EXAMPLE/CLASS
function Class(parent) 	local class = {} 	local mClass = {} 	class.__index = class 	mClass.__index = parent 	class.Super = parent 	function mClass:__call(...) 		local instance = setmetatable({}, class) 		if type(class.init) == "function" then 			return instance, instance:init(...) 		end 		return instance 	end 	return setmetatable(class, mClass) end

-- IMPORT EXAMPLE/EXAMPLECLASS
ExampleClass = Class()

function ExampleClass:init(msg)
  self.msg = msg
end

function ExampleClass:foo()
  I:LogToHud(self.msg)
end

-- IMPORT TEST/TEST
function Main()
  local exampleObject = ExampleClass("Hello Neter")
  exampleObject:foo()
end

function Update(i)
    I = i
    Main()
end
    