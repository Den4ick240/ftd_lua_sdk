require("example.ExampleClass")
require("I")
require("Mathf")
require("Vector3")

function Update(I)
	local exampleObject = ExampleClass(I)
	exampleObject:foo()
end
