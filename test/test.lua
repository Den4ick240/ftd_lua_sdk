require("example.ExampleClass")
require("I")
require("Mathf")
require("Vector3")
require("Quaternion")

function Update(I)
	local exampleObject = ExampleClass(I)
	exampleObject:foo()
end
