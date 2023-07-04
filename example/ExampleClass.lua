require("example.Class")
require("I")

ExampleClass = Class()

function ExampleClass:init(I)
	self.I = I
end

function ExampleClass:foo()
	self.I:LogToHud("Hello World!")
end
